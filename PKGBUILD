#Contributor: Justiknueser <justi n dot k ueser @ gmai----l dot com>
#Maintainer: jakob <grandchild@gmx.net>

pkgname=ibniz
pkgver=1.18
pkgrel=3
pkgdesc="VM designed for extremely compact low-level audiovisual programs/demos"
depends=('sdl')
makedepends=('perl')
arch=('any')
license=('ZLIB')
url="http://pelulamu.net/ibniz/"
source=(http://pelulamu.net/ibniz/$pkgname-$pkgver.tar.gz)
sha512sums=('63448e3eb639a831b847cc3a737040a661ff4107e53ff70b9c33ba951c584ca903729547efd27afff9ac0b9e25a315a1d36670a4f4722c3d2287f375cb1bd760')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's:FLAGS=`sdl-config:FLAGS=--std=c99 `/usr/bin/sdl-config:g' Makefile
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make
	install -D -m755 ibniz "$pkgdir/usr/bin/ibniz"
	install -D -m644 licence.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
