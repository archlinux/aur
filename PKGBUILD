# Maintainer: BonnyAD9 (Bonny4)
pkgname=thedit
pkgver=0.1.2
pkgrel=1
pkgdesc="Hexdump and interactive hex viewer with familiar controls."
arch=(x86_64)
url="https://bonnyad9.github.io/uamp/"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'luajit')
makedepends=(cargo)
optdepends=()
provides=()
source=("https://github.com/BonnyAD9/thedit/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('fbc2bbfc696dc6b6ca92bf574fe55b9b')
options=('!debug')

build() {
    cd "thedit-$pkgver"
    env
    cargo build -r
}

package() {
    cd "thedit-$pkgver"
    
    I_DIR="$pkgdir/usr/bin"
    mkdir -p "$I_DIR"
    cp "target/release/thedit" "$I_DIR/thedit"
}
