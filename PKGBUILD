# Maintainer: BonnyAD9 (Bonny4)
pkgname=uamp
pkgver=0.5.9
pkgrel=1
pkgdesc="Universal Advanced Music Player written in rust."
arch=(x86_64)
url="https://bonnyad9.github.io/uamp/"
license=('GPL-3.0-or-later')
depends=(gcc-libs alsa-lib glibc)
makedepends=(git cargo)
optdepends=()
provides=(uamp)
source=("https://github.com/BonnyAD9/uamp/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    cd "uamp-$pkgver"
    cargo build -r
}

package() {
    cd "uamp-$pkgver"

    I_DIR="$pkgdir/usr/bin"
    mkdir -p "$I_DIR"
    cp "target/release/uamp" "$I_DIR/uamp"

    I_DIR="$pkgdir/usr/share/man/man1"
    mkdir -p "$I_DIR"
    cp "other/manpages/uamp.1" "$I_DIR/uamp.1"

    I_DIR="$pkgdir/usr/share/man/man5"
    mkdir -p "$I_DIR"
    cp "other/manpages/uamp.5" "$I_DIR/uamp.5"
}
