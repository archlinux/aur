# Maintainer: darkfm salvadorp2001@gmail.com
pkgname=('gnomekiss')
pkgver='2.0'
pkgrel='2'
pkgdesc="KiSS Doll viewer for GNOME"
arch=('i686' 'x86_64')
url="http://devel.tlrmx.org/kiss/"
license=('GPL')
depends=('gtk2' 'atk' 'pango' 'freetype2' 'glib2' 'libgnomeui')
source=("http://devel.tlrmx.org/kiss/source/$pkgname-$pkgver.tar.gz" "gnomekiss-2.0.patch")
sha1sums=('1c0c2082c5331387f420329ada66e0c31202fcbb'
          'd16a8612c8cb97ca9af0c184d5f882434f97259a')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "${srcdir}/gnomekiss-2.0.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
