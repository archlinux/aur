# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="0.27.0"
pkgrel=2
pkgdesc="A friendly language for building type-safe, scalable systems!"
arch=('any')
url="http://github.com/gleam-lang/gleam"
license=('Apache2')
depends=('erlang-nox')
makedepends=('rust')
provides=('gleam')
options=(strip !docs !libtool !staticlibs)
source=("https://github.com/gleam-lang/gleam/archive/v${pkgver}.tar.gz")
sha256sums=('e62bc5976439a17c4c827fa9a25a84c36d08fff1396bbf916ef5219664c17e81')
sha512sums=('0156b67a7ec00d8f29e218989f7eb009d2dcdbe6f14e9dbbdf85d56d4accc5b08494a1c0bc72e37b7fbfff564322e3e8d657d85001ee8314f1595a290c7b5bca')

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
