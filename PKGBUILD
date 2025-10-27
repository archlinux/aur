# Maintainer: Schlafhase <linus.schneeberg at gmail dot com>
pkgname=discord-mass-redact
pkgver=1.1.3
pkgrel=1
pkgdesc='Tool to remove a large selection of discord messages'
arch=('x86_64')
url='https://github.com/BioTomateDE/DiscordMassRedact'
license=('GPL-3.0-or-later')
depends=('openssl')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9fe1115d0becd44a7bfc176255e4b46fdebb3f28388633c59e3a06998006385e')

build() {
    cd "DiscordMassRedact-$pkgver"
    cargo build --release
}

package() {
    cd "DiscordMassRedact-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
