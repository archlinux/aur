# Maintainer: Ryan Wilson <ryan@ryanwilson.io>
pkgname=fafind-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Fast parallel filesystem search by filename (faf / fafind)"
arch=('x86_64' 'aarch64')
url="https://github.com/rywils/fafind"
license=('MIT')
provides=('fafind' 'faf')
conflicts=('fafind')
options=('!debug' 'strip')
_url="https://github.com/rywils/fafind/releases/download/v${pkgver}"
source=(
  "LICENSE::https://raw.githubusercontent.com/rywils/fafind/v${pkgver}/LICENSE"
)
source_x86_64=(
  "fafind-x86_64-${pkgver}.tar.gz::${_url}/fafind-linux-x86_64-v${pkgver}.tar.gz"
)
source_aarch64=(
  "fafind-arm64-${pkgver}.tar.gz::${_url}/fafind-linux-arm64-v${pkgver}.tar.gz"
)
sha256sums=('f500e1e4b3d5c32caedbd5d5d6ff1a92b683cd0bc3a41053cfd4fa0b51a854c1')
sha256sums_x86_64=('73bb17880b8cc9d76443d06d81781ca62623355039f55cfbce1a7948f59d12cd')
sha256sums_aarch64=('b5042bd1c68aa941bfff617a7051685e2e33b4c8e0974fe4dd87e1fd3f53207d')

package() {
  install -Dm755 fafind "${pkgdir}/usr/bin/fafind"
  ln -s fafind "${pkgdir}/usr/bin/faf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
