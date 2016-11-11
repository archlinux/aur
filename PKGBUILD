# Maintainer: Yamakaky <yamakaky@yamaworld.fr>
pkgname=bloaty-git
pkgver=0.0.0.r68.g263f2ef
pkgrel=2
pkgdesc="A size profiler for binaries"
arch=("x86_64" "x86")
url="https://github.com/google/bloaty"
license=("Apache")
makedepends=("git" "gcc")
source=("git+https://github.com/google/bloaty")
md5sums=("SKIP")

pkgver() {
    cd bloaty
    printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/bloaty"
    make
}

package() {
    install -D "$srcdir/bloaty/bloaty" "$pkgdir/usr/bin/bloaty"
}
