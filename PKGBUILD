# Maintainer: maki <maki@hotmilk.space>

pkgname=frankenphp-bin
pkgver=1.11.0
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
sha256sums_x86_64=('31255a52413234989c2a4a1dd86f577a303a14bab07db49be035605a9bf0af33')
sha256sums_aarch64=('f8d458475d30b8d0c32bd9e178fc677a611f319772bd94955c2962d3ecb401f5')

package() {
	cd "$srcdir"
	install -Dm755 "frankenphp-linux-$CARCH" "$pkgdir/usr/bin/frankenphp"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
