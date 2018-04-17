# Maintainer: kitsunyan <kitsunyan@inbox.ru>

pkgname=intel-undervolt
pkgver=1.2
pkgrel=1
pkgdesc='Intel CPU undervolting tool'
arch=('any')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
backup=(etc/intel-undervolt.conf)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b5bd3e08d00ab19e035f03ca58745211347228029551edd5383ee9bf370a5d50')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
