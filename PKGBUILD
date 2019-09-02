#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="XDE .desktop entry helpers"
pkgname=xde-helpers
pkgver=1.5
pkgrel=1
arch=('any')
license=('GPL')
url="http://github.com/bbidulock/xde-helpers"
groups=('xde')
depends=('xde-icons' 'xdg-utils' 'gxmessage-gtk2' 'desktop-file-utils')
install=${pkgname}.install
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
md5sums=('dda71200f4e18734ccb657ee491d638d')

build() {
 cd $pkgname-$pkgver
 ./configure --sysconfdir=/etc
 make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: et sw=2:
