# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=cargo-aoc
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple CLI tool that aims to be a helper for the Advent of Code"
arch=('x86_64')
url="https://github.com/gobanos/cargo-aoc"
license=('MIT' 'Apache')
depends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gobanos/cargo-aoc/archive/$pkgver.tar.gz")
sha256sums=('2a33a861a03087690cc2ab690567c3ab906c5b31a53d96159e9d552e14ecc960')

build() {
	cd "$pkgname-$pkgver/cargo-aoc"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dt "$pkgdir"/usr/bin target/release/cargo-aoc
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m 644 cargo-aoc/LICENSE-MIT
}
