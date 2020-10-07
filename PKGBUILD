# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="0.11.2"
pkgrel=1
pkgdesc="A statically typed language for the Erlang VM"
arch=('any')
url="http://github.com/lpil/gleam/"
license=('Apache2')
depends=('erlang-nox')
makedepends=('rust')
provides=('gleam')
options=(strip !docs !libtool !staticlibs)
source=("https://github.com/lpil/gleam/archive/v${pkgver}.tar.gz")
sha256sums=('3f308915fac58876aeae39cedfbdb44dd7775567ace36ff3b83ddb4ea1498ce0')
sha512sums=('95b3b867423d134e434eaeb294a1d9c4afdb451b53dd30743785fc790c61dcbd4ff35e106c1845d09455342687915a5338f5ef18fdd275d6e967c2c5e97f0c3e')

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
