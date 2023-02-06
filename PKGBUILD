# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="0.26.2"
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
sha256sums=('96b7f14e7cb5428e82b36d4d7a7bde3067a849c4bc8486b1b5caea49d5e5bce7')
sha512sums=('f9731fd0ce5c7d3464aa5318146892c4c69541851a5b71e8ee001462f624f48d53a32401bbdea87b2a8f2a24313b15ee3ef039b6b38e84a347699742c98da078')

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
