# Maintainer: Anthony DeStefano <adx@fastmail.fm> 

pkgname=flrig
pkgver=1.3.24
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

md5sums=('404224b5879cf39e5214478a21cf9b44')
sha512sums=('061dadf4ef8ba4c5e120658f06d51d8d281a0e3f657b9a6f28f58ad4ce79540566305f8602a2c93b67632a11192826d047ec4897b62597505079a42bb5170682')
