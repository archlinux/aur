# Maintainer: PolyMeilex <bartek.marynczak@op.pl>
pkgname="dirbkm-git"
pkgver=0.0.1
pkgrel=1
pkgdesc="Linux Directory Bookmarking CLI"
arch=('i686' 'x86_64')
url="https://github.com/PolyMeilex/dirbkm.git"
license=('GPL3')
depends=()
makedepends=('git' 'rust')
source=("dirbkm::git+https://github.com/PolyMeilex/dirbkm.git")
md5sums=("SKIP")

build() {
    cd "$srcdir/dirbkm"
    cargo build --release --locked
}

package() {
    cd "$srcdir/dirbkm"
    install -Dm 755 target/release/dirbkm -t "${pkgdir}/usr/bin"
}
