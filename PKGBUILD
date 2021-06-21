# Maintainer: atom <admin@eyun.cf>

pkgname=python-esphome-dashboard
pkgver=20210617.1
pkgrel=1
pkgdesc="A user facing dashboard embedded in ESPHome"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/esphome/dashboard"
license=('MIT')
source=(dashboard-$pkgver.tar.gz::https://github.com/esphome/dashboard/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('b7400f508874a5453433a3547afe5729e7c5508d67fd94991ea97945f23bdb16')

build() {
  cd "$srcdir/dashboard-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/dashboard-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
