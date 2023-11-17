pkgname="ata2"
pkgver=3.0.1
pkgrel=2
pkgdesc="Ask the Terminal Anything²"
arch=('x86_64')
url="https://github.com/ctrlcctrlv/ata2"
makedepends=('git' 'cargo')
source=(
    "git+https://github.com/ctrlcctrlv/ata2.git#tag=v$pkgver"
)
md5sums=('SKIP')
conflicts=(
    ata2-git
)
provides=(
    ata
)

build() {
    cd $srcdir/$pkgname
    cargo build --release
}

package() {
    install -D $srcdir/$pkgname/target/release/$pkgname $pkgdir/usr/bin/$pkgname
}
