# Maintainer: haxibami <contact at haxibami dot net>

pkgname=pipes-rs
pkgver=1.6.2
pkgrel=1
pkgdesc="An over-engineered rewrite of pipes.sh in Rust"
arch=('any')
url="https://github.com/lhvy/pipes-rs"
license=("BlueOak-1.0.0")
makedepends=('cargo')
source=(
  "https://github.com/lhvy/pipes-rs/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('0b5edd33fe78ed65d54161fdc0a65fd6f9ca1637f555533b3b6d3392cd58dba7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
