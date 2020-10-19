# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=osccli
pkgver=0.1
pkgrel=3
pkgdesc="Fast and simple cli tool for Open Sound Control communication, written in Rust"
arch=('x86_64')
url="https://github.com/madskjeldgaard/osccli"
license=('GPL')
groups=('pro-audio')
depends=()
makedepends=('git' 'cargo' 'rust')
source=("$pkgname-$pkgver.zip::${url}/archive/v${pkgver}.zip")
sha256sums=("SKIP")

check() {
	cd "$pkgname-$pkgver"
	cargo test --locked
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release 
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/osccli" "$pkgdir/usr/bin/$pkgname"
}
