# Maintainer: kmille <github@androidloves.me>

pkgname=python-ping3
_name=ping3
pkgver=5.1.3
pkgrel=1
arch=('any')
url="https://github.com/kyan001/ping3"
license=('MIT')
pkgdesc="Pure Python3 version of ICMP ping, shipped with command-line command"
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://github.com/kyan001/ping3/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('ae1bc00b1f9eea516fc8c2b6476d6b73c6280758901947856aec97c0761b2c07')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
