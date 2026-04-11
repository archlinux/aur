# Maintainer: njkevlani <njkevlani@gmail.com>
pkgname=qmk-light-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="CLI tool to control VIA/QMK keyboard backlight brightness"
arch=('x86_64' 'aarch64')
url="https://github.com/njkevlani/qmk-light"
license=('MIT')
depends=('hidapi')
provides=('qmk-light')
conflicts=('qmk-light')

source_x86_64=("https://github.com/njkevlani/qmk-light/releases/download/v${pkgver}/qmk-light-linux-amd64")
sha256sums_x86_64=("29a49add810a55574f823ebd3e261798dffdf10bb60cf3755a1418e2942e0aa8")

source_aarch64=("https://github.com/njkevlani/qmk-light/releases/download/v${pkgver}/qmk-light-linux-arm64")
sha256sums_aarch64=("196fb566707687c498a6b7638a48e069a85cba5fc54eb7aaa508fadbec134def")

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/qmk-light-linux-amd64" "${pkgdir}/usr/bin/qmk-light"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/qmk-light-linux-arm64" "${pkgdir}/usr/bin/qmk-light"
  fi
}
