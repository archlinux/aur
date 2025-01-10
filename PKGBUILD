# Maintainer: meclondrej <ondrej.mecl@volny.cz>

pkgname=rsrcon
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple RCON client written in rust"
arch=("x86_64")
license=("MIT")
depends=("glibc")
makedepends=("git" "rust")
url="https://github.com/meclondrej/rsrcon"
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14c04e89935e50bbcf72c285b7c9256a9ce16a8e168230099621cbb3018ffe00')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/rsrcon" "$pkgdir/usr/bin/rsrcon"
}

