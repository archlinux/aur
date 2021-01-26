# Maintainer: Tim van Leuverden <timmy1e at protonmail dot ch>

pkgname=ruri
pkgver=2.0.0
pkgrel=2
pkgdesc="Calculates the CRC-32 of a file and checks it against the filename."
arch=('any')
url="https://gitlab.com/Timmy1e/ruri"
license=('AGPL3')

depends=('gcc-libs')

makedepends=('cargo')

source=(
  "https://gitlab.com/Timmy1e/ruri/-/archive/v2.0.0/ruri-v2.0.0.tar.gz"
)

sha256sums=(
  '65638f066d5f1f319b4a3ba82ed214a31dbdd8a5ab34d3bbff9b85df38c67b2e'
)

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  cargo build --locked --release --target-dir target
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-v${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim: sw=2 ts=2 tw=80 et: