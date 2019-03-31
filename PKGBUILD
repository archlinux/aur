# Maintainer: Luclu7 <me at luclu7 dot fr>
pkgname=akmey
pkgver=0.1.8
pkgrel=1
pkgdesc="Akmey client"
arch=('x86_64')
url="https://github.com/akmey/akmey-client"
license=('custom: Unlicense')
makedepends=('go' 'make')
conflicts=('akmey-bin')
source=("https://github.com/akmey/akmey-client/archive/v$pkgver-alpha.tar.gz")
sha512sums=('f2a1dba821d7a7e23a225d34f0de5b269413c57118250e126acec62df6ab67b6afd2658517680db0e8db3b1c5b98c9293ee92ff6efc4506c2d10a34505e8c992')

warn_build_references() {
    : # I like __FILE__ and don't consider build references to be a problem
}

build() {
	cd "akmey-client-$pkgver-alpha"
	make
}

package() {
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "akmey-client-$pkgver-alpha"
	install -Dm755 akmey "$pkgdir/usr/bin/akmey"
}
