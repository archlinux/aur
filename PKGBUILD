# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="0.12.1"
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
sha256sums=('93797ef144f863120d305691913a21a3c42881c6cbc5a07bb2fe8336456e9aa8')
sha512sums=('4ebc0a04e50c83cb703755d97a0583c7c578772f5cac0e6d1a938a8e6f56874a2f6193f306dea1f46335177911e06ece83c89180672c21d1107ea40fbbca8e25')

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
