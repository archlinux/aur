# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="0.20.1"
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
sha256sums=('2cd909bdef561b480a536be20606a7617d19680e067c8d4a14d0f05fb6a0cd22')
sha512sums=('b3bb109583eb5c543036b97556d570618e3037a5376b9922324a3f7da0758d90f661dd610d86ee20470a2405b19ab42940d450c1086d668cb873624c87add5e9')

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
