# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=natural-scrolling-forever
pkgver=r3.97109f6
pkgrel=1
pkgdesc="Enable natural scrolling for current and future devices."
arch=(any)
url="https://github.com/WhyNotHugo/$pkgname"
license=(ISC)
depends=(python-pyudev)
source=("git+https://github.com/WhyNotHugo/$pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
