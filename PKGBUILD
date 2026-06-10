# Maintainer: BonnyAD9 (Bonny4)
pkgname=thedit
pkgver=0.1.0
pkgrel=1
pkgdesc="Hexdump and interactive hex viewer with familiar controls."
arch=(x86_64)
url="https://bonnyad9.github.io/uamp/"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=(cargo)
optdepends=()
provides=()
source=("https://github.com/BonnyAD9/thedit/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('18d0d0a8d9c781f4d49ac473cafdaf00')
options=('!debug')

build() {
    cd "thedit-$pkgver"
    cargo build -r
}

package() {
    cd "thedit-$pkgver"
    
    I_DIR="$pkgdir/usr/bin"
    mkdir -p "$I_DIR"
    cp "target/release/thedit" "$I_DIR/thedit"
}
