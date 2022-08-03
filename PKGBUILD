# Maintainer: Andrea Orru <andrea at orru.io>

pkgname=bass-git
pkgver=r79.c3962ec
pkgrel=1
pkgdesc='Table-based, multi-architecture, cross-platform macro assembler'
arch=('x86_64')
url='https://github.com/ARM9/bass'
license=('custom:none')
makedepends=('git')
source=('git+https://github.com/ARM9/bass.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/bass"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/bass/bass"
    make
}

package() {
    install -Dm755 "$srcdir/bass/bass/out/bass" "$pkgdir/usr/bin/bass"
}
