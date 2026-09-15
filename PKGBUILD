# Maintainer: Monjaris <ziyanovruzlu750@gmail.com>

pkgname=vexa-git
pkgver=r1.g0000000
pkgrel=1
pkgdesc="Modern cross-platform graphics framework in C++"
arch=('x86_64')
url="https://github.com/monjaris/vexa"
license=('MIT')

makedepends=('git')

source=('vexa::git+https://github.com/monjaris/vexa.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/vexa"

    printf "r%s.g%s\n" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/vexa"

    ./build.sh
}

package() {
    cd "$srcdir/vexa"

    install -Dm755 libvexa.so \
        "$pkgdir/usr/lib/libvexa.so"

    cp -r include "$pkgdir/usr/"
}
