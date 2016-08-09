# Maintainer: kevku <kevku@gmx.com>
pkgname=geckodriver
pkgver=0.10.0
pkgrel=1
pkgdesc="Proxy for using W3C WebDriver-compatible clients to interact with Gecko-based browsers."
arch=("x86_64")
url="https://github.com/mozilla/geckodriver"
license=("MPL")
makedepends=("rust" "cargo")
source=("https://github.com/mozilla/geckodriver/archive/v$pkgver.tar.gz")
sha256sums=('bdbdd9e01831d48afeb324cf5c8f02aadad5bd30e4308e3fb34a07b596c547f5')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
        install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
        ln -sf /usr/bin/$pkgname "$pkgdir"/usr/bin/wires
}

