#Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="Icons for the X Desktop Environment (XDE)"
pkgname=xde-icons
pkgver=1.8
pkgrel=1
arch=(any)
license=(CC-BY-SA-1.0)
url="http://github.com/bbidulock/xde-icons"
groups=('xde')
depends=('hicolor-icon-theme' 'mist-icon-theme')
conflicts=('ayatana-indicator-session')
makedepends=('librsvg')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
md5sums=('e83e3b0106f5a88ff333905049f5935c')

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
