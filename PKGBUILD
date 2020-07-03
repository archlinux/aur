# Maintainer Arthur Shevchenko <niktob560@yandex.ru>

pkgbase=pkgbase
pkgname=rrot
pkgver=1.0
pkgrel=1
pkgdesc="Rot encoder written in rust"
license=('GPL3.0')
_source=(
    "https://github.com/niktob560/rrot"
)
arch=('x86_64')
provides=('rrot')
sha1sums=('SKIP')
makedeps=(
   cargo
   git
)

build() {
    cd $srcdir
    cargo build --release
}

package() {
    cd $srcdir
    mkdir -p $pkgdir/usr/bin/
    install -m 0555 $srcdir/target/release/$pkgname $pkgdir/usr/bin/$pkgname
}

pkgver() {
    cd $srcdir
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#vim: syntax=sh
