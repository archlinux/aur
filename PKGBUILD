# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="0.12.0"
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
sha256sums=('927f903801de55843baacaaf8977a12383cc912fe8374859f82e766c44d7a69a')
sha512sums=('63452b28bdc9129327749747be8a6fb106acc3f353957705da721f4362194a093445c9448ad88530109df8621a69b03b9f3d72d7e4d53af2bc161e52751288bf')

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
