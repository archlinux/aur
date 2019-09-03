#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="Icons for the X Desktop Environment (XDE)"
pkgname=xde-icons
pkgver=1.3
pkgrel=1
arch=(any)
license=(CCPL:by-sa)
url="http://github.com/bbidulock/xde-icons"
groups=('xde')
depends=('hicolor-icon-theme' 'mist-icon-theme')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
makedepends=('librsvg')
md5sums=('f04a3859d1c0867df86019a5422ad3bd')

build() {
 cd $pkgname-$pkgver
  ./configure --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/share/icons/hicolor/32x32/apps/arch-logo.png"
  rm -f "$pkgdir/usr/share/icons/hicolor/scalable/apps/arch-logo.svg"
  rm -f "$pkgdir/usr/share/pixmaps/arch-logo.svg"
}

# vim: et sw=2:
