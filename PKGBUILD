# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: gh0stwizard <vitaliy.tokarev@gmail.com>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=volume-app
pkgver=1.1a
pkgrel=2
pkgdesc="Volume.app is a WM dockapp enabling control of a computer's audio volume level."
arch=('i686' 'x86_64')
url="http://volume-app.sourceforge.net/"
license=('GPL')
depends=('libxpm')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4c1b180fa54e90e113fa8a1c02e660f2')

build() {
	cd "$srcdir/volume.app-$pkgver"
	make
}
package() {
	cd "$srcdir/volume.app-$pkgver"
	make PREFIX="$pkgdir/usr" install
  	mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
  	install -m 644 AUTHORS README TODO "$pkgdir/usr/share/doc/$pkgname"
}
