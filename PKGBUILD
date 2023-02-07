pkgname="ata"
pkgver=1.0.2
pkgrel=0
pkgdesc="Ask the Terminal Anything"
arch=('x86_64')
url="https://github.com/rikhuijzer/ata"
makedepends=('cargo')
source=(
    "git+https://github.com/rikhuijzer/ata.git#tag=v$pkgver"
)
md5sums=('SKIP')
conflicts=(
    ata-bin
    ata-git
)

build() {
    cd $srcdir/ata
    cargo build --release
}

package() {
    install -D $srcdir/ata/target/release/ata $pkgdir/usr/bin/ata
}
