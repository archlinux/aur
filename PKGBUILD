# Maintainer: BonnyAD9 (Bonny4)
pkgname=mproc
pkgver=0.2.2
pkgrel=1
pkgdesc="Small CLI utitlity to measure process runtime and memory usage."
arch=(x86_64)
url="https://github.com/BonnyAD9/mproc/"
license=('GPL-3.0-or-later')
depends=(gcc-libs glibc)
makedepends=(cargo)
optdepends=()
provides=()
source=("https://github.com/BonnyAD9/mproc/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')
options=('!debug')

build() {
    cd "mproc-$pkgver"
    cargo build -r
}

package() {
    cd "mproc-$pkgver"
    
    I_DIR="$pkgdir/usr/bin/"
    mkdir -p "$I_DIR"
    cp "target/release/mproc" "$I_DIR"
    
    I_DIR="$pkgdir/usr/share/licenses/mproc/"
    mkdir -p "$I_DIR"
    cp "LICENSE" "$I_DIR"
}