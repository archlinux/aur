# Maintainer: darkfm salvadorp2001@gmail.com
pkgname=('gnomekiss')
pkgver='2.0'
pkgrel='1'
pkgdesc="KiSS Doll viewer for GNOME"
arch=('i686' 'x86_64')
url="http://devel.tlrmx.org/kiss/"
license=('GPL')
depends=('gtk2' 'atk' 'pango' 'freetype2' 'glib2' 'libgnomeui')
source=("http://devel.tlrmx.org/kiss/source/$pkgname-$pkgver.tar.gz")
sha1sums=('1c0c2082c5331387f420329ada66e0c31202fcbb')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
