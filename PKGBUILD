# Maintainer: Kuokuo123 <kuoyu1204@gmail.com>
pkgname="otter-launcher"
pkgver=0.5.1
pkgrel=3
pkgdesc="A rust-based cli/tui launcher built for keyboard-centric users, featuring vi & emacs keybinds, ascii decoration, etc"
arch=("x86_64")
url="https://github.com/kuokuo123/otter-launcher"
license=('GPL-3.0')
makedepends=(git cargo)
options=(!debug)
backup=("etc/otter-launcher/config.toml")
source=("https://github.com/kuokuo123/otter-launcher/archive/refs/tags/v0.5.1-3.tar.gz")
md5sums=('ac797b8e8634acb64d0e46cc7204849a')

build() {
	cd "$pkgname-$pkgver-$pkgrel"
	cargo build --release 
}

package() {
	install -Dm0755 "$pkgname-$pkgver-$pkgrel/target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "$pkgname-$pkgver-$pkgrel/config_example/config.toml" "${pkgdir}/etc/$pkgname/config.toml"
	install -Dm644 "$pkgname-$pkgver-$pkgrel/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
