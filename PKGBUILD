# Maintainer: Ryan Wilson <ryan@ryanwilson.io>
pkgname=faf-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Fast parallel filesystem search by filename"
arch=('x86_64' 'aarch64')
url="https://github.com/eof0/faf"
license=('MIT')
provides=('faf')
conflicts=('faf' 'fafind-bin')
replaces=('fafind-bin')
options=('!debug' 'strip')
_url="https://github.com/eof0/faf/releases/download/v${pkgver}"
source=(
  "faf-LICENSE::https://raw.githubusercontent.com/eof0/faf/v${pkgver}/LICENSE"
)
source_x86_64=(
  "faf-x86_64-${pkgver}.tar.gz::${_url}/faf-linux-x86_64-v${pkgver}.tar.gz"
)
source_aarch64=(
  "faf-arm64-${pkgver}.tar.gz::${_url}/faf-linux-arm64-v${pkgver}.tar.gz"
)
sha256sums=('f500e1e4b3d5c32caedbd5d5d6ff1a92b683cd0bc3a41053cfd4fa0b51a854c1')
sha256sums_x86_64=('0179554cdcc2badb24c60c3d69d799d2a03a7cf73a8fd8b4c893acc2257f242c')
sha256sums_aarch64=('df9130af8e9da9398aa1c4deee37b87b71de6c5008cbd1f720cf83d55a9587ae')

package() {
  install -Dm755 faf "${pkgdir}/usr/bin/faf"
  install -Dm644 faf-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
