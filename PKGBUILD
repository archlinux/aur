# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Tony Fettes <tonyfettes@tonyfettes.tk>
pkgname=tunasync-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Mirror job management tool developed by TUNA.(Prebuilt version)"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/tuna/tunasync"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64-bin.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-bin.tar.gz")
sha256sums_aarch64=('5a02fef3bb231f7de486c85452f178de79b61375399a9e55da36691449ef0401')
sha256sums_x86_64=('9092b29a52ee76ee2efc2ef17690701d761be1e9e3fb6b174f5710fb53e98a0a')
package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname%-bin}tl" -t "${pkgdir}/usr/bin"
}