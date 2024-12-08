# Maintainer: meclondrej <ondrej.mecl@volny.cz>

pkgname=rsrcon
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple RCON client written in rust"
arch=("x86_64")
license=("MIT")
depends=("glibc")
makedepends=("git" "rust")
url="https://github.com/meclondrej/rsrcon"
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('90d8d065809cfd1c28741185cd980edc9a43e96a7480c691106df80a4b774f32')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/rsrcon" "$pkgdir/usr/bin/rsrcon"
}

