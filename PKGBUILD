# Maintainer: Luclu7 <me at luclu7 dot fr>
pkgname=akmey
pkgver=0.6
pkgrel=1
pkgdesc="Akmey client"
arch=('x86_64')
url="https://github.com/akmey/akmey-client"
license=('custom: Unlicense')
makedepends=('go')
conflicts=('akmey-bin')
source=("https://github.com/akmey/akmey-client/archive/v$pkgver-alpha.tar.gz")
sha512sums=('d2d0292194bba9a4cd5a39e42fb7abf35753e8b58e1a6687c92fd3def134976953b1899e5af36422dc76d16c41cfdc1e26a5b73db9f11076b01f1b33e8ec243a')

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
