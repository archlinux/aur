# Maintainer: Schlafhase <linus.schneeberg at gmail dot com>
pkgname=discord-mass-redact
pkgver=1.3.0
pkgrel=1
pkgdesc='Tool to remove a large selection of discord messages'
arch=('x86_64')
url='https://github.com/BioTomateDE/DiscordMassRedact'
license=('GPL-3.0-or-later')
depends=('openssl')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('66fa393d5390e378c5f432b13cfe48a7be2658b7efb634622b5fb12aa3c5551c')

build() {
	cd "DiscordMassRedact-$pkgver"
	cargo build --release
}

package() {
	cd "DiscordMassRedact-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
