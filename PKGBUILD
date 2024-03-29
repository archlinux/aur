# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='python-language-data'
pkgver=1.1
pkgrel=1
pkgdesc='Languages supplementary data for python-langcodes'
arch=(any)
url='https://github.com/rspeer/language_data'
license=('custom:MIT')  # No LICENSE file in the git repo
depends=(
  'python'
  'python-langcodes'
  'python-setuptools'
  'python-marisa-trie')
makedepends=('python-build' 'python-installer' 'python-wheel')
_srcurl='https://files.pythonhosted.org/packages'
_srcurl="${_srcurl}/f4/ef/b2176538ebb01ac7c08b29c9d8cf878275ff98a4e717c57ee8123c373424"
_srcurl="${_srcurl}/language_data-${pkgver}.tar.gz"
source=("${_srcurl}")
sha256sums=('c1f5283c46bba68befa37505857a3f672497aba0c522b37d99367e911232455b')
_tardir="language_data-${pkgver}"

build() {
  cd "${srcdir}/${_tardir}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_tardir}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
