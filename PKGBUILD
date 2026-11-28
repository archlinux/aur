# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=camsnap-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Capture snapshots and clips and run motion detection on RTSP/ONVIF cameras"
arch=('x86_64' 'aarch64')
url="https://github.com/steipete/camsnap"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/camsnap_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/camsnap_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a3f28946d1e9a08b1e0a63ff6cfb6b86b87479db66ee3bfe1a2f43f200cccc86')
sha256sums_aarch64=('8d6010b9cdc4c06884957c6201d47a218d15b8fb5cc03cc4337a11b1ea4adda4')

package() {
  install -Dm755 "camsnap" "${pkgdir}/usr/bin/camsnap"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
