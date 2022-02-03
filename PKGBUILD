#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="Icons for the X Desktop Environment (XDE)"
pkgname=xde-icons
pkgver=1.7
pkgrel=1
arch=(any)
license=(CCPL:by-sa)
url="http://github.com/bbidulock/xde-icons"
groups=('xde')
depends=('hicolor-icon-theme' 'mist-icon-theme')
conflicts=('ayatana-indicator-session')
makedepends=('librsvg')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
md5sums=('a086f59198ad2d8f008ada5b5c416a49')

build() {
 cd $pkgname-$pkgver
  ./configure --sysconfdir=/etc
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/share/icons/hicolor/32x32/apps/arch-logo.png"
  rm -f "$pkgdir/usr/share/icons/hicolor/scalable/apps/arch-logo.svg"
  rm -f "$pkgdir/usr/share/pixmaps/arch-logo.svg"
}

# vim: et sw=2:
