# Maintainer: Valerie Wolfe <sleeplessval@gmail.com>

pkgname=pride
pkgver=0.4.1
pkgrel=1
pkgdesc="Pride flags in the terminal."
url="https://git.vwolfe.io/valerie/pride"
license=("MIT")
arch=("x86_64")
provides=("pride")
conflicts=("pride")
source=("https://git.vwolfe.io/valerie/pride/archive/v$pkgver.tar.gz")
sha256sums=("aa05132de118b50c0a12702c0558814e8012a5de317a987541806f39cdbfc662")

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
