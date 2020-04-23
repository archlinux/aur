# Maintainer: Luclu7 <me at luclu7 dot fr>
pkgname=akmey
pkgver=0.5
pkgrel=1
pkgdesc="Akmey client"
arch=('x86_64')
url="https://github.com/akmey/akmey-client"
license=('custom: Unlicense')
makedepends=('go')
conflicts=('akmey-bin')
source=("https://github.com/akmey/akmey-client/archive/v$pkgver-alpha.tar.gz")
sha512sums=('7c95680af052280896759261be446983065b4f31d2c685bd10014300adee7a12f651c995b262f2ea7e184cadd7b7a8474b973745b067cdcfaea99b3ed7b51de0')

warn_build_references() {
    : # I like __FILE__ and don't consider build references to be a problem
}

build() {
	cd "akmey-client-$pkgver-alpha"
	go build
}

package() {
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "akmey-client-$pkgver-alpha"
	install -Dm755 akmey-client "$pkgdir/usr/bin/akmey"
}
