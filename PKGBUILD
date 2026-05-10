# Maintainer: njkevlani <njkevlani@gmail.com>
pkgname=qmk-light-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="CLI tool to control VIA/QMK keyboard backlight brightness"
arch=('x86_64' 'aarch64')
url="https://github.com/njkevlani/qmk-light"
license=('MIT')
depends=('hidapi')
provides=('qmk-light')
conflicts=('qmk-light')

source_x86_64=("https://github.com/njkevlani/qmk-light/releases/download/v${pkgver}/qmk-light-linux-amd64")
sha256sums_x86_64=("891c6b3377abb9cf99eba8da6069fff83abfc7c10f5ec4ef0cf2b02608f07d68")

source_aarch64=("https://github.com/njkevlani/qmk-light/releases/download/v${pkgver}/qmk-light-linux-arm64")
sha256sums_aarch64=("6659181d963f5f72a4ab3f845cfbbf072cb5aa141dcbb25de355a6dcdb960987")

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/qmk-light-linux-amd64" "${pkgdir}/usr/bin/qmk-light"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/qmk-light-linux-arm64" "${pkgdir}/usr/bin/qmk-light"
  fi
}
