# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="1.8.0"
pkgrel=2
pkgdesc="A friendly language for building type-safe, scalable systems!"
arch=('any')
url="http://github.com/gleam-lang/gleam"
license=('Apache2')
depends=('erlang-core')
optdepends=('rebar3')
makedepends=('rust')
provides=('gleam')
options=(strip !docs !libtool !staticlibs !lto)
source=("https://github.com/gleam-lang/gleam/archive/v${pkgver}.tar.gz")
sha256sums=('296a04e27c8df16750c36d4d167646967a2ed71e3e2e1ae6e724c631a22c99df')
sha512sums=('daf3f0d943ae87713ca1c731531b99cca8b2058a3f7f05901442a6a705d5e859f1e7bf65b030643ad91b2cd81a29198ea41fbe2287fffe803f4829d6dbe0be3e')

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
