# Maintainer: BonnyAD9 (Bonny4)
pkgname=makemake
pkgver=2.0.0
pkgrel=1
pkgdesc="Program for creating and using folder templates, written in rust"
arch=(x86_64)
url="https://github.com/BonnyAD9/makemake-rs"
license=('MIT')
depends=()
makedepends=(git cargo)
optdepends=()
provides=(makemake)
backup=()
source=("https://github.com/BonnyAD9/makemake-rs/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    cd "makemake-rs-$pkgver"
    cargo build -r
}

package() {
    cd "makemake-rs-$pkgver"
    I_DIR="$pkgdir/usr/bin"
    mkdir -p "$I_DIR"
    cp "target/release/makemake" "$I_DIR/makemake"

    I_DIR="$pkgdir/usr/share/man/man7"
    mkdir -p "$I_DIR"
    cp "useful_stuff/man-page/makemake.7" "$I_DIR/makemake.7"
}
