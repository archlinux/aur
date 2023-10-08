# shellcheck shell=bash
pkgname="fennel-ls-git"
pkgrel=1
pkgdesc="Language Server for Fennel"
pkgver=r111.8245255
arch=("any")
url="https://sr.ht/~xerool/fennel-ls"
license=("MIT")
depends=("lua")
makedepends=("make" "git")
source=("git+https://git.sr.ht/~xerool/fennel-ls")
b2sums=("SKIP")

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${pkgname%-git}"
    make
}

package() {
    cd "${pkgname%-git}"
    make install PREFIX="${pkgdir}/usr"
}
