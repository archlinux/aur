# Maintainer: 0xMRTT <0XMRTT@proton.me>

pkgname=python-hgchat
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Google Bard API in Python"
arch=('any')
url="https://codeberg.org/Bavarder/googlebardpy"
license=('GPL3')
depends=( 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('002fdfd9d7eb7a526d4478d56873b3c6e713de9c58252a5fc49eec2d328d677e')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
