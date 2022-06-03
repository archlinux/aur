# Maintainer: CaptainYukinoshitaHachiman <CaptainYukinoshitaHachiman at ProtonMail dot com>
pkgname=melwalletd
pkgver=0.3.15
pkgrel=1
pkgdesc="Wallet daemon for Themelio"
arch=('x86_64' 'i686' 'aarch64')
url="https://themelio.org/"
license=('MPL2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/themeliolabs/melwalletd/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('debc5df249415188c33afeee8c45cd1015ee4f28b8e95bbaf1b046cf76112f21fc4566f7e8ea5e9d1001bba1e06a57459f193196a8fc6a954112e2946c37f654')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/melwalletd" "${pkgdir}/usr/bin/melwalletd"
}
