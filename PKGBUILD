# Maintainer: Anthony DeStefano <adx@fastmail.fm> 

pkgname=flrig
pkgver=1.3.23
pkgrel=1
pkgdesc="Amateur Radio Transceiver Control Program"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/"
license=('GPL')
depends=('fltk')
optdepends=( )
source=(http://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
	cd "$srcdir"
	cd $pkgname-$pkgver

	CFLAGS='-g' CXXFLAGS='-g' ./configure --prefix=/usr
	make ASCIIDOC_ICONS_DIR=/etc/asciidoc/images/icons/
}

check() {
	cd "$srcdir"/$pkgname-$pkgver

	make -k check
}

package() {
	cd "$srcdir"/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}

md5sums=('c87fe55a68c8e92b624d572554f674e4')
sha512sums=('8ccadbd699b053936ef7e9263a843304b4df97194c8bb3b4d07012b424ebe156a5fb960ce893967a7114c4ee2d21c6b0d43c18a50ddaa4f03ee8c912d8b8d281')
