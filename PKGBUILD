# Maintainer: atom <admin@eyun.cf>

pkgname=python-esphome-dashboard
pkgver=20210623.0
pkgrel=1
pkgdesc="A user facing dashboard embedded in ESPHome"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/esphome/dashboard"
license=('MIT')
source=(dashboard-$pkgver.tar.gz::https://github.com/esphome/dashboard/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('70fa48efb2a9024fd5df799c1150e8c624bfd764bc4a22e5bd397c701d87029b')

build() {
  cd "$srcdir/dashboard-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/dashboard-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
