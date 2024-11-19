# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="1.6.1"
pkgrel=1
pkgdesc="A friendly language for building type-safe, scalable systems!"
arch=('any')
url="http://github.com/gleam-lang/gleam"
license=('Apache2')
depends=('erlang-nox')
makedepends=('rust')
provides=('gleam')
options=(strip !docs !libtool !staticlibs !lto)
source=("https://github.com/gleam-lang/gleam/archive/v${pkgver}.tar.gz")
sha256sums=('86bdaa4b7803230bd434044e0632f6d31246a8514fd68d10c3add9dfff400544')
sha512sums=('c0ed1f6bbb021e7c9ac320446366369d740a5802f46a8bb237ac3529d60e53a7f0e95108b25749fa49cfa1613a62d64e7bd1bff444694250c93a1c3901ba6dd2')

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
