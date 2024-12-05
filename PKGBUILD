# Maintainer: meclondrej <ondrej.mecl@volny.cz>

pkgname=rsrcon
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple Source RCON client written in rust"
arch=("x86_64")
license=("MIT")
depends=("glibc")
makedepends=("git" "rust")
url="https://github.com/meclondrej/rsrcon"
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("9c2bcdde4333ea0575d70350fc9f842ebc7eaadb51fa08139fa459665e08b695")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/rsrcon" "$pkgdir/usr/bin/rsrcon"
}

