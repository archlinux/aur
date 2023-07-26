# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="0.30.4"
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
sha256sums=('8c2d8155e4f4cf4d3ca3e85892b6e5bed0930c491a1384b1018a39afec7949e0')
sha512sums=('dd1e6ec34e382f647679f27642b72134366bdf8b217e085c420f08179ab9c7c88c3fbef2dd931f7c9c39eba8a54888ac811af7e57e3ddf8a5f6ac2fdab879f71')

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
