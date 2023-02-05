pkgname="ata-git"
pkgver=1.0.0
pkgrel=0
pkgdesc="Ask the Terminal Anything"
arch=('x86_64')
url="https://github.com/rikhuijzer/ata"
makedepends=('cargo')
source=(
    "git+https://github.com/rikhuijzer/ata.git"
)
md5sums=('SKIP')

build() {
    cd $srcdir/ata
    cargo build --release
}

package() {
    install -D $srcdir/ata/target/release/ata $pkgdir/usr/bin/ata
}
