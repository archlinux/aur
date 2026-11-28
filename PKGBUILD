# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=opentaint-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="Open-source taint analysis engine"
arch=('x86_64' 'aarch64')
url="https://github.com/seqra/opentaint"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/seqra/opentaint/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/opentaint-cli_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/opentaint-cli_linux_arm64.tar.gz")
sha256sums=('d045cb0a85d7df41ebe5392abc603e1772465ccf9c55cc208e839d3db5767490')
sha256sums_x86_64=('7cfbaf8cec2a8e9136f2babfd7f2d466005e5d4a3ac2a5b540e14e0a0985bd69')
sha256sums_aarch64=('591a0688ad08990900a6a8982c8bd9b17ba01481ab90d1d2b1903a6b901859e3')

package() {
  install -Dm755 "opentaint" "${pkgdir}/usr/bin/opentaint"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
