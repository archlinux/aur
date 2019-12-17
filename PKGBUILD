# Maintainer: Norbert Melzer <timmelzer PLUS aur AT gmail DOT com>

pkgname=gleam
pkgver="0.5.0"
pkgrel=1
pkgdesc="A statically typed language for the Erlang VM"
arch=('any')
url="http://github.com/lpil/gleam/"
license=('Apache2')
depends=('erlang-nox')
makedepends=('rust')
checkdepends=()
optdepends=()
provides=('gleam')
conflicts=()
replaces=()
backup=()
options=(strip !docs !libtool !staticlibs)
install=
changelog=
source=("https://github.com/lpil/gleam/archive/v${pkgver}.tar.gz")
md5sums=('feb77722aafa46fa51c149646ee09094')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"

    # cd gleam;
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
