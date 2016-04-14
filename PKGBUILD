# Maintainer: Anthony DeStefano <adx@fastmail.fm> 

pkgname=flrig
pkgver=1.3.25
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

sha512sums=('b845b125d58f4254f00d5e3fc758e7b3ee1cbf502df8d88058d47e791ef0e6fc4e5daccc477c4d1b5f716a9eaded309cb2e80b3b94499970620173a1c5c86b62')
