# Maintainer: Schlafhase <linus.schneeberg at gmail dot com>
pkgname=discord-mass-redact
pkgver=1.2.0
pkgrel=1
pkgdesc='Tool to remove a large selection of discord messages'
arch=('x86_64')
url='https://github.com/BioTomateDE/DiscordMassRedact'
license=('GPL-3.0-or-later')
depends=('openssl')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('212b4405a3d03e1d61ad588b171b8fd7117da28dc3668e80621b1e4d76303a62')

build() {
    cd "DiscordMassRedact-$pkgver"
    cargo build --release
}

package() {
    cd "DiscordMassRedact-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
