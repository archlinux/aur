# Maintainer: kevku <kevku@gmx.com>
pkgname=geckodriver
pkgver=0.8.0
pkgrel=1
pkgdesc="Proxy for using W3C WebDriver-compatible clients to interact with Gecko-based browsers."
arch=("x86_64")
url="https://github.com/mozilla/geckodriver"
license=("MPL")
makedepends=("rust" "cargo")
source=("https://github.com/mozilla/geckodriver/archive/v$pkgver.tar.gz")
sha256sums=('a3b2cc5fd48622cdc811f952565ab235e5b64b5776e1f03c889a5c5c02367e1a')

build() {
	cd "$pkgname-$pkgver"
	cargo build --no-default-features --release
}

package() {
	cd "$pkgname-$pkgver"
        install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
        ln -sf /usr/bin/$pkgname "$pkgdir"/usr/bin/wires
}

