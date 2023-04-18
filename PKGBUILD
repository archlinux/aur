# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="0.28.3"
pkgrel=1
pkgdesc="A friendly language for building type-safe, scalable systems!"
arch=('any')
url="http://github.com/gleam-lang/gleam"
license=('Apache2')
depends=('erlang-nox')
makedepends=('rust')
provides=('gleam')
options=(strip !docs !libtool !staticlibs)
source=("https://github.com/gleam-lang/gleam/archive/v${pkgver}.tar.gz")
sha256sums=('e9c6b7400a21d0d29db59b0c5b6adc8cec492184461f778f3b36bc989f1226da')
sha512sums=('38f805726c2835e90a9c637a5d959ba00049579632ed4a4e51540aa1f35b944893e935b99c33cb1e75feb0c82b711b8cf4d5eacbefb6bbe7eb005af2d40affba')

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
    local basedir="${pkgdir}/usr/bin"
    install -Dm755 "target/release/gleam" "${basedir}/gleam"
}
