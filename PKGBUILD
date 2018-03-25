#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="XDE .desktop entry helpers"
pkgname=xde-helpers
pkgver=1.3
pkgrel=1
arch=('any')
license=('GPL')
url="http://github.com/bbidulock/xde-helpers"
groups=('xde')
depends=('xde-icons' 'xdg-utils' 'gxmessage' 'desktop-file-utils')
install=${pkgname}.install
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('c6b36017a5eda7af1fc321bd0e505583')

build() {
 cd $pkgname-$pkgver
 ./configure --prefix=/usr --sysconfdir=/etc
 make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: et sw=2:
