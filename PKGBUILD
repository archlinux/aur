# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=cli-stash
pkgver=0.2.8
pkgrel=1
pkgdesc="Terminal UI for saving and recalling shell commands"
arch=('x86_64')
url="https://github.com/itcaat/$pkgname"
license=('MIT')
makedepends=('git' 'go')
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('d5d6bf9cd4ea48ab585041e46593b51a0075eedd3a1f4e11e2996f254c66494f')

prepare() {
    cd ${pkgname}
#   patch --forward --strip=1 --input="${srcdir}/py-version-updates.patch"
#    export RUSTUP_TOOLCHAIN=stable
#    cargo fetch --locked --target $(rustc --print host-tuple)
    true
}

build() {
    cd ${pkgname}
    go build -o cli-stash .
}

package() {
    cd ${pkgname}
    install -Dm0755 -t "$pkgdir/usr/bin/" cli-stash
}
