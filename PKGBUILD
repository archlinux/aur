# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=cli-stash
pkgver=0.2.10
pkgrel=1
pkgdesc="Terminal UI for saving and recalling shell commands"
arch=('x86_64')
url="https://github.com/itcaat/$pkgname"
license=('MIT')
makedepends=('git' 'go')
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('a21958d261b96c3762cac0020caffd4d71ca722e81959306fdcf974a04dde03e')

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
