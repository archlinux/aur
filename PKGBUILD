# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Jason Nader <jason d0t nader pr0t0nmail.c0m>

pkgname=cargo-cache
pkgver=0.6.2
pkgrel=1
pkgdesc="Display info and prune cargo cache"
arch=('x86_64')
url="https://github.com/matthiaskrgr/cargo-cache"
source=("$pkgname-$pkgver.tar.gz::https://github.com/matthiaskrgr/cargo-cache/archive/$pkgver.tar.gz")
license=('MIT' 'Apache')
depends=('cargo')
sha256sums=('b0d28a95646c867e977ff2e5636afec5559bbafa2809b8a47914db9877aab7b6')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-cache" "$pkgdir/usr/bin/cargo-cache"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
}
