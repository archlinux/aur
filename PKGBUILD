# Maintainer: 0xMRTT <0XMRTT@proton.me>
# Maintainer: Matthew Sexton <matthew@Asylumtech.com>

pkgname=python-baichat-py
_name=baichat_py
pkgver=0.3.0
pkgrel=1
pkgdesc="BAIChat API Python"
arch=('any')
url="https://codeberg.org/Bavarder/baichat-py"
license=('GPL3')
depends=( 'python-requests' 'python-aiohttp' 'python-curl-cffi')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0a411ec897e6b1ffde175c40481886cbae2adca8e68eeaa209b693851c959715')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
