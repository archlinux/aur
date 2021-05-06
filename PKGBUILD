# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="0.15.0"
pkgrel=1
pkgdesc="A statically typed language for the Erlang VM"
arch=('any')
url="http://github.com/lpil/gleam/"
license=('Apache2')
depends=('erlang-nox')
makedepends=('rust')
provides=('gleam')
options=(strip !docs !libtool !staticlibs)
source=("https://github.com/gleam-lang/gleam/archive/v${pkgver}.tar.gz")
sha256sums=('f2bcb345ebfc110aaf7fe769c07d1579065ab97b42237d1689f1cc6d82635979')
sha512sums=('e19cfc7de44892763f643ff1e9dd3406a7de69b81a7b5179dac27dba069442a1a2ab9c1b5bfc9fb1cb789b508968551f4c542b8068ffac0691bccb4ce89293c6')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

check() {
    cd "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    local basedir="${pkgdir}/usr/local/bin"
    install -Dm755 "target/release/gleam" "${basedir}/gleam"
}
