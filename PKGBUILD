# Maintainer: maki <maki@hotmilk.space>

pkgname=frankenphp-bin
pkgver=1.9.1
pkgrel=1
pkgdesc='FrankenPHP is a modern application server for PHP built on top of the Caddy web server.'
arch=('x86_64' 'aarch64')
url='https://github.com/php/frankenphp'
license=('MIT')
options=('!strip') # purego binary

source=("LICENSE::https://raw.githubusercontent.com/php/frankenphp/refs/tags/v$pkgver/LICENSE")

source_prefix="https://github.com/php/frankenphp/releases/download/v$pkgver/frankenphp-linux"
source_x86_64=("$source_prefix-x86_64")
source_aarch64=("$source_prefix-aarch64")

sha256sums=('96e04afcae74c52f02e43e693c97b5ba0c64694ba44c1c642d7f242cfe21d18c')
sha256sums_x86_64=('e65a335bc1067b1b78a0205cd1f9a51e4ed7e744a0f54eceee4d3ac3c9371f1b')
sha256sums_aarch64=('b67387eed2ef1ade728ba77cb63256ddfa5eb35ef878a5f87f104fbdd17ef543')

package() {
	cd "$srcdir"
	install -Dm755 "frankenphp-linux-$CARCH" "$pkgdir/usr/bin/frankenphp"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
