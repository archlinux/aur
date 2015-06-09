# Maintainer: Anthony DeStefano <adx@fastmail.fm> 

pkgname=flrig
pkgver=1.3.22
pkgrel=1
pkgdesc="Amateur Radio Transceiver Control Program"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com/flrig-help/index.html"
license=('GPL')
depends=('fltk')
optdepends=( )
source=(http://w1hkj.com/downloads/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
	cd "$srcdir"
	cd $pkgname-$pkgver

	CFLAGS='-g' CXXFLAGS='-g' ./configure --prefix=/usr \
		--enable-tls
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

md5sums=('a000cd2dff7f90ba7aba4b45644fdcbd')
sha512sums=('51525de330ead7dd5f79d447dc53c6710a99faa4550c06fe3a80e6e504f67bd0a40fbd4befb907ee8770d7a69831ab993f1553e9ecb44e96d8140cc8471b3235')
