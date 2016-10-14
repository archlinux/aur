# Maintainer: kevku <kevku@gmx.com>
pkgname=geckodriver
pkgver=0.11.1
pkgrel=1
pkgdesc="Proxy for using W3C WebDriver-compatible clients to interact with Gecko-based browsers."
arch=("x86_64")
url="https://github.com/mozilla/geckodriver"
license=("MPL")
makedepends=("rust" "cargo")
source=("https://github.com/mozilla/geckodriver/archive/v$pkgver.tar.gz")
sha256sums=('faa4d398b2dce60ec46534739a4b8273bc98d1246cb7b26c89625353875d3434')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
        install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
        ln -sf /usr/bin/$pkgname "$pkgdir"/usr/bin/wires
}

