# Maintainer: Valerie Wolfe <sleeplessval@gmail.com>

pkgname=pride
pkgver=0.3.1
pkgrel=1
pkgdesc="Pride flags in the terminal."
url="https://git.vwolfe.io/valerie/pride"
license=("MIT")
arch=("x86_64")
provides=("pride")
conflicts=("pride")
source=("https://git.vwolfe.io/valerie/pride/archive/v$pkgver.tar.gz")
sha256sums=("84ae4b41cb09afac5df4890491c7c7579f1b34e2680e51cb27f3ce9baa3519ca")

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
