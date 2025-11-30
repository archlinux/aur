# Maintainer: BonnyAD9 (Bonny4)
pkgname=clipr
pkgver=0.1.2
pkgrel=1
pkgdesc="Small CLI utitlity reading/writing system clipboard."
arch=(x86_64)
url="https://github.com/BonnyAD9/clipr/"
license=('GPL-3.0-or-later')
depends=(gcc-libs glibc)
makedepends=(cargo)
optdepends=()
provides=()
source=("https://github.com/BonnyAD9/clipr/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')
options=('!debug')

build() {
    cd "clipr-$pkgver"
    cargo build -r
}

package() {
    cd "clipr-$pkgver"
    
    I_DIR="$pkgdir/usr/bin/"
    mkdir -p "$I_DIR"
    cp "target/release/clipr" "$I_DIR"
    
    # I_DIR="$pkgdir/usr/share/licenses/clipr/"
    # mkdir -p "$I_DIR"
    # cp "LICENSE" "$I_DIR"
}