pkgname="checkout"
pkgver=0.1.0
pkgrel=2
epoch=1

pkgdesk="Small C program, that creates a directory and enters it"
license=("BSD3")

makedepends=("git" "xmake")

provides=("checkout")
conflicts=("checkout")

arch=('any')

source=("git+https://github.com/egevtech/checkout.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/checkout"

    xmake build
}

package() {
    cd "$srcdir/checkout/build"

    install -Dm755 checkout "$pkgdir/usr/bin/checkout"
}