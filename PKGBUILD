# Maintainer: maki <maki@hotmilk.space>

pkgname=frankenphp-bin
pkgver=1.9.1
pkgrel=2
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
sha256sums_x86_64=('737ababc288c33069913f82e32d219b44b4186b40695925e1567788660210030')
sha256sums_aarch64=('b7b0756e1b2e1ffebd1980d4b6f3c1e88453a531a237ab9774a325a23b5e5f8a')

package() {
	cd "$srcdir"
	install -Dm755 "frankenphp-linux-$CARCH" "$pkgdir/usr/bin/frankenphp"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
