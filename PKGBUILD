# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: BonnyAD9 (Bonny4)
pkgname=makemake
pkgver=1.1.1
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
source=("https://github.com/BonnyAD9/makemake-rs/archive/refs/tags/v1.1.1.tar.gz")
md5sums=('SKIP')

build() {
    cd "makemake-rs-1.1.1"
    cargo build -r
}

package() {
    cd "makemake-rs-1.1.1"
    I_DIR="$pkgdir/usr/bin"
    mkdir -p "$I_DIR"
    cp "target/release/makemake" "$I_DIR/makemake"
}
