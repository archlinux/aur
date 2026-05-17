# Maintainer: Ryan Wilson <ryan@ryanwilson.io>
pkgname=fafind-bin
pkgver=1.1.0
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
sha256sums_x86_64=('ddd5e414b05d64f327d7f2d8e30b4c6e56a50d4648e6758e741edcfdd3697e65')
sha256sums_aarch64=('74802bd019e20aad58b6c1bef934d4f185c2dbab6e07048ad3e3d4297359801b')

package() {
  install -Dm755 fafind "${pkgdir}/usr/bin/fafind"
  ln -s fafind "${pkgdir}/usr/bin/faf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
