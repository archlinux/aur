# Maintainer: 0xMRTT <0XMRTT@proton.me>

pkgname=python-baichat-py
_name=baichat_py
pkgver=0.2.1
pkgrel=1
pkgdesc="BAIChat API Python"
arch=('any')
url="https://codeberg.org/Bavarder/baichat-py"
license=('GPL3')
depends=( 'python-requests' 'python-aiohttp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('834de3c8d544c9724f089d7b8051bac5787d519b769cecac9054059ef559b0fb')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
