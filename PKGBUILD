# Maintainer: Riccardo Berto <riccardobrt at gmail>
pkgname=redis-rejson
_pkgname=rejson
pkgver=1.0.1
pkgrel=1
pkgdesc="Redis module that implements ECMA-404 The JSON Data Interchange Standard as a native data type."
arch=('x86_64')
url="https://github.com/RedisLabsModules/rejson"
license=('AGPL-3.0')
depends=('redis')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('0513b8dd96ae4802da5e6fb5e41a4a615c6d4297c0c438ed49bd3c459c89f8ffabf9242e51b544f4a9bf9a026c9cfcae630c1122f0c6a33e7bb415cd51f65ca1')

prepare() {
	cd "$_pkgname-$pkgver"
}

build() {
	cd "$_pkgname-$pkgver"
	make
}

package() {
	cd "$_pkgname-$pkgver"
	install -D src/rejson.so $pkgdir/usr/lib/redis/rejson.so
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/rejson/LICENSE
}
