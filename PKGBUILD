# Maintainer: Dennis Kraus kraus@posteo.de

pkgname=toipe
pkgver=0.4.1
pkgrel=1
pkgdesc="yet another typing test, but crab flavoured "
arch=("x86_64")
url="https://github.com/Samyak2/toipe"
license=("MIT")
depends=()
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Samyak2/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fd1fdeffecdf5cb664d3b5c675ecde62476df689b2314c5c223eb988a1ef2209')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo check --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
