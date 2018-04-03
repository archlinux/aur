# Maintainer: kitsunyan <kitsunyan@inbox.ru>

pkgname=intel-undervolt
pkgver=1.1
pkgrel=1
pkgdesc='Intel CPU undervolting tool'
arch=('any')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
backup=(etc/intel-undervolt.conf)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e7fb03134cda1729b7a6acc7ed51cdd004cecce339dc6fa4ecd6646e6870c42a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
