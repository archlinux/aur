# Maintainer: maki <maki@hotmilk.space>

pkgname=frankenphp-bin
pkgver=1.12.2
pkgrel=1
pkgdesc='FrankenPHP is a modern application server for PHP built on top of the Caddy web server.'
arch=('x86_64' 'aarch64')
url='https://github.com/php/frankenphp'
license=('MIT')
options=('!strip') # purego binary

source=("LICENSE::https://raw.githubusercontent.com/php/frankenphp/refs/tags/v$pkgver/LICENSE")

source_prefix="https://github.com/php/frankenphp/releases/download/v$pkgver/frankenphp-linux"
source_x86_64=("frankenphp-$pkgver-x86_64::$source_prefix-x86_64")
source_aarch64=("frankenphp-$pkgver-aarch64::$source_prefix-aarch64")

sha256sums=('96e04afcae74c52f02e43e693c97b5ba0c64694ba44c1c642d7f242cfe21d18c')
sha256sums_x86_64=('234c90198e967aeed92e8455252f12a07c41e4a34b71f39640634bba9faca0b0')
sha256sums_aarch64=('5c60134942211779ac380e7ced2f18950a87d18ecbf1735849931c5201615383')

package() {
	cd "$srcdir"
	install -Dm755 "frankenphp-$pkgver-$CARCH" "$pkgdir/usr/bin/frankenphp"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
