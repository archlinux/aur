# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=vtracer
pkgver=0.6.4
pkgrel=2
pkgdesc="Convert PNG to SVG"
arch=(x86_64)
url="https://github.com/visioncortex/vtracer"
license=('MIT')
depends=('gcc-libs')
options=('!lto')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/visioncortex/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a4b554afe0384ddbdb5f96dde2d2e6f412493ae990acc32e0d71c4f8b63d8ba4')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 target/release/vtracer "${pkgdir}/usr/bin/vtracer"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
