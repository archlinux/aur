# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: tyr0 <thomas.hoernes@gmx.at>
pkgname=peksystray
pkgver=0.4.0
pkgrel=6
pkgdesc="Peksystray is a small system tray designed for all the light window managers supporting docking."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/peksystray/"
license=('GPL')
depends=('libx11')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('735a216684f1db65bfe71697452cafc0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure LIBS="-L/usr/lib/X11" --prefix=/usr \
	--x-libraries="-lSM -lICE -lX11 -lXext"
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
 
