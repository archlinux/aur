# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname='python-aksharamukha'
_proj_name="${pkgname#python-}"
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
source=("https://files.pythonhosted.org/packages/source/${_proj_name::1}/$_proj_name/$_proj_name-$pkgver.tar.gz")
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
