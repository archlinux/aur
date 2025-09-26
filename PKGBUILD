# Maintainer: Kuokuo123 <kuoyu1204@gmail.com>
pkgname="otter-launcher"
pkgver=0.5.8
pkgrel=1
pkgdesc="A rust-based cli/tui launcher built for keyboard-centric users, featuring vi & emacs keybinds, ascii decoration, etc"
arch=("x86_64")
url="https://github.com/kuokuo123/otter-launcher"
license=('GPL-3.0')
makedepends=(git cargo)
options=(!debug)
backup=("etc/otter-launcher/config.toml")
source=("https://github.com/kuokuo123/otter-launcher/archive/refs/tags/v0.5.8.tar.gz")
sha256sums=('5c1b44f50ed253011bf8fe133126042ff0f17f438dff95aea74caab61f44ddc3')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release 
}

package() {
	install -Dm0755 "$pkgname-$pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver/config_example/config.toml" "${pkgdir}/etc/$pkgname/config.toml"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
