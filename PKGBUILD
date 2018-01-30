# Maintainer: kitsunyan <kitsunyan@inbox.ru>

pkgname=intel-undervolt
pkgver=1.0
pkgrel=1
pkgdesc='Intel CPU undervolting tool'
arch=('any')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
depends=(msr-tools)
backup=(etc/intel-undervolt.conf)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3988138ca1c784d68a17eca1aab0abf5794f4b5abf758f89023190c0d073867c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
