# Maintainer: Tim van Leuverden <TvanLeuverden at Gmail dot com>

pkgname=ruri
pkgver=2.0.1
pkgrel=1
pkgdesc="Calculates the CRC-32 of files and checks them against their filename"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://gitlab.com/Timmy1e/ruri"
license=('AGPL3')

provides=('ruri')

depends=('gcc-libs')

makedepends=('cargo')

source=(
  "https://gitlab.com/Timmy1e/ruri/-/archive/v${pkgver}/ruri-v${pkgver}.tar.gz"
)

sha256sums=(
  'ef7883661b0f145b6bf9b7d6be172b2c17198003625f28ce7950065d489f5a20'
)

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  cargo install --locked --no-track --bin ruri --path . --root "${srcdir}"
}

package() {
  install -Dm755 "${srcdir}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim: sw=2 ts=2 tw=80 et: