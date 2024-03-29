# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='python-aksharamukha'
pkgver='2.1.2'
pkgrel=1
pkgdesc='Indic scripts converter'
arch=(any)
url='https://aksharamukha.appspot.com/python'
license=('AGPL-3.0-only')
depends=(
  'python-fonttools'
  'python-langcodes'
  'python-language-data'
  'python-pykakasi'
  'python-regex'
  'python-requests'
  'python-yaml'
  'python>=3.8')
optdepends=()
makedepends=('python-build' 'python-installer' 'python-wheel')
_src_url='https://files.pythonhosted.org/packages/'
_src_url="${_src_url}28/af/62556d7f1ef2001c6855f894bec094f615e808bc78aaadd758b123eb1a16/"
_src_url="${_src_url}aksharamukha-${pkgver}.tar.gz"
source=("$_src_url")
sha256sums=('30ba28d78046e390537c93e45ff8d54398a8e91e4b569ffe6db42fd81c2ff894')
_tardir="aksharamukha-${pkgver}"

build() {
  cd "${srcdir}/${_tardir}"
  ls
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_tardir}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
