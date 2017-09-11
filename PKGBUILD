# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=flake
pkgver=0.11
pkgrel=1
pkgdesc="an open-souce FLAC audio encoder"
arch=('i686' 'x86_64')
url="http://flake-enc.sourceforge.net"
license=('LGPL2.1')
source=("http://downloads.sourceforge.net/flake-enc/$pkgname-$pkgver.tar.bz2")
md5sums=('a01f663adf897f872df71e1c28b7ae79')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --disable-debug
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
