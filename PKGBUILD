# Maintainer: maki <maki@hotmilk.space>

pkgname=frankenphp-bin
pkgver=1.10.1
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
sha256sums_x86_64=('04b1a8df9d5204922f3aa4d9aa118db946ce0ede832a8280c746ad4c3a3f7e4c')
sha256sums_aarch64=('08a2581c44df92dad85f276c636d3d7614c0ce04d0e00bcba34163b1c656c283')

package() {
	cd "$srcdir"
	install -Dm755 "frankenphp-linux-$CARCH" "$pkgdir/usr/bin/frankenphp"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
