# Maintainer: kmille <github@androidloves.me>

pkgname=python-ping3
_name=ping3
pkgver=4.0.4
pkgrel=2
arch=('any')
url="https://github.com/kyan001/ping3"
license=('MIT')
pkgdesc="Pure Python3 version of ICMP ping, shipped with command-line command"
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://github.com/kyan001/ping3/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('1a14aacf3d4b2a5456dfdff940acbf980c456388c92fe4c8d9d2ee3a38873eb5')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
