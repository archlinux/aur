# Maintainer: Valerie Wolfe <sleeplessval@gmail.com>

pkgname=pride
pkgver=0.4.3
pkgrel=1
pkgdesc="Pride flags in the terminal."
url="https://git.sleeplessval.io/valerie/pride"
license=("MIT")
arch=("x86_64")
provides=("pride")
conflicts=("pride")
source=("https://git.sleeplessval.io/valerie/pride/archive/v$pkgver.tar.gz")
sha256sums=("62333ec4ad0d4e0e85edb349231c02ce0167f65a6972e32b5fc918ccc8c485bc")

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "man/$pkgname.6" "$pkgdir/usr/share/man/man6/$pkgname.6"
}
