# Maintainer: kevku <kevku@gmx.com>
pkgname=geckodriver
pkgver=0.9.0
pkgrel=1
pkgdesc="Proxy for using W3C WebDriver-compatible clients to interact with Gecko-based browsers."
arch=("x86_64")
url="https://github.com/mozilla/geckodriver"
license=("MPL")
makedepends=("rust" "cargo")
source=("https://github.com/mozilla/geckodriver/archive/v$pkgver.tar.gz")
sha256sums=('e372b26465743113db6bc591246f5795be8dbe61162572d1b3bc546cccfa9320')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
        install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
        ln -sf /usr/bin/$pkgname "$pkgdir"/usr/bin/wires
}

