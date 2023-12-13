# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Tony Fettes <tonyfettes@tonyfettes.tk>
pkgname=tunasync-bin
pkgver=0.8.0
pkgrel=3
pkgdesc="Mirror job management tool developed by TUNA"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/tuna/tunasync"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64-bin.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-bin.tar.gz")
sha256sums_aarch64=('00e5ef369c0cb7f58e9ea6742f6a27b1058d3451a25b57c3ae4658b9a210ca91')
sha256sums_x86_64=('6d7481f50438e704e78322e754d2e5cd3c34dfe4d1d3a3f12d332237759f79bd')
package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname%-bin}ctl" -t "${pkgdir}/usr/bin"
}