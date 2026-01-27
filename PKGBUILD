# Maintainer: maki <maki@hotmilk.space>

pkgname=frankenphp-bin
pkgver=1.11.1
pkgrel=2
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
sha256sums_x86_64=('ed302616c5eb6adc94bb6b08ec8c5e5f2fda954a77a2170db7ead40bfa29836e')
sha256sums_aarch64=('8d654ab833ad4ffc8a1f72f8f72d83d5d50354c3d0bbbda0c5dc7a0471841cbc')

package() {
	cd "$srcdir"
	install -Dm755 "frankenphp-$pkgver-$CARCH" "$pkgdir/usr/bin/frankenphp"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
