# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=cli-stash
pkgver=0.2.9
pkgrel=1
pkgdesc="Terminal UI for saving and recalling shell commands"
arch=('x86_64')
url="https://github.com/itcaat/$pkgname"
license=('MIT')
makedepends=('git' 'go')
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('c51cc6893fbc924cf4babcd396042a9035e307ae344daf3e1371d51e777d32a2')

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
