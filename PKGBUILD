# Maintainer: Martin Rys <rys.rs/contact>

pkgname=vtracer
pkgver=0.6.4
pkgrel=1
pkgdesc="Convert PNG to SVG"
arch=(x86_64)
url="https://github.com/visioncortex/vtracer"
license=('MIT')
depends=('gcc-libs')
options=('!lto')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/visioncortex/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bea5233769f2295e7122f1e6b6180f34799f6faf6e645a060b21e0b98b0da740')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 target/release/vtracer "${pkgdir}/usr/bin/vtracer"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
