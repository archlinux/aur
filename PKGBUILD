# Maintainer: haxibami <contact at haxibami dot net>

pkgname=pipes-rs
pkgver=1.6.1
pkgrel=1
pkgdesc="An over-engineered rewrite of pipes.sh in Rust"
arch=('any')
url="https://github.com/lhvy/pipes-rs"
license=("BlueOak-1.0.0")
makedepends=('cargo')
source=(
  "https://github.com/lhvy/pipes-rs/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '93e2b8e8afb6e8ecde20bf3b4fab6e9dc4abeacbf7d2065929611d2c43cf8638'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
