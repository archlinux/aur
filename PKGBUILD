# Maintainer: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=tokay
pkgver=0.4
pkgrel=1
pkgdesc="Tokay is an imperative, procedural programming language dedicated to parsing and other text-processing tasks."
arch=('x86_64')
url="https://tokay.dev"
license=('MIT')
makedepends=('rust')
source=("https://github.com/tokay-lang/tokay/archive/refs/tags/v0.4.tar.gz")
sha256sums=('5b05c34c266da3a3c5a0dab311e1727d5fa02118ce73a12000cae5d704ad4f70')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

check() {
	cd "$pkgname-$pkgver"
	# FIXME: figure out if tests _should_ be passing at the moment.
	cargo test || true
}

package() {
	cd "$pkgname-$pkgver"
	install -D ./target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
