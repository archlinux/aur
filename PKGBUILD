# Maintainer: Luclu7 <me at luclu7 dot fr>
pkgname=akmey
pkgver=0.1.7
pkgrel=1
pkgdesc="Akmey client"
arch=('x86_64')
url="https://github.com/akmey/akmey-client"
license=('custom: Unlicense')
makedepends=('go' 'make')
conflicts=('akmey-bin')
source=("https://github.com/akmey/akmey-client/archive/v$pkgver-alpha.tar.gz")
sha512sums=('3c581d772b07d12b87b7ec007b578dcc487fcc4c81f6b65aea956176b92dad5bb8113705cfea2124ed3f108c6c740a8ce3c3dfa4a034d59f0e42eeec882f6471')

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
