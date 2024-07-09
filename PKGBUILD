# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="1.3.0"
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
sha256sums=('cecca23e79aaa3b091ea23784a5d7f543c1cc0b2901e8ff6e495db67e8bd4640')
sha512sums=('c2a678d6bb82790b72576afc0811a62499fe04a0418c8a893f0bfa84a0277eabd0aa776125df1e59e18c4885a71618b2d71cb725b7e61eef34b57930dd78c6cf')

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
