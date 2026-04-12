# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=cli-stash
pkgver=0.2.11
pkgrel=1
pkgdesc="Terminal UI for saving and recalling shell commands"
arch=('x86_64')
url="https://github.com/itcaat/$pkgname"
license=('MIT')
makedepends=('git' 'go')
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('b872f4b42b7fc5e631cf8e0037976612514471125d9ca2c5f8a6fae3f07a775d')

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
