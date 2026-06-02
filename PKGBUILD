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
sha256sums_x86_64=('c5687e2d4f2ee5362c9260dcc369a1c15fa4073cf7fd2d61ed49d70e594f0e65')
sha256sums_aarch64=('36bf83f3f9b691763301f040e8f1850e88955d2cb18490c5f0acda1ea9333465')

package() {
  install -Dm755 fafind "${pkgdir}/usr/bin/fafind"
  ln -s fafind "${pkgdir}/usr/bin/faf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
