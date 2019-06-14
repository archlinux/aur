# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=igor
pkgver=1.595
pkgrel=1
pkgdesc="proofreader for mdoc(7) and docbook files"
url="http://www.wonkity.com/~wblock/igor"
_mirror="http://docscripts.glenbarber.us/tags/igor"
arch=('any')
license=('BSD')
options=('!strip')
source=("$_mirror/$pkgver/$pkgname-$pkgver.tar.gz"
	'igor.patch')
sha256sums=('f0e1895235d6dac23f94759dd013a8bcb9b8d0235bfe44fb65f3a19c804810a4'
            'e2fc335879143faf9ed2d7ddb7757747dcfad9a1b8c04ce85239ab35aca54718')
prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 -i "${srcdir}/igor.patch"
}

package() {
	install -Dm755 "$pkgname-$pkgver/igor" "${pkgdir}/usr/bin/igor"
	install -Dm644 "$pkgname-$pkgver/igor.1" "${pkgdir}/usr/share/man/man1/igor.1"
}
