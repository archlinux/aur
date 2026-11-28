# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gphotosdl-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="Original-resolution Google Photos downloader for use with rclone"
arch=('x86_64' 'aarch64')
url="https://github.com/rclone/gphotosdl"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/gphotosdl_Linux_x86_64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/gphotosdl_Linux_arm64.zip")
sha256sums_x86_64=('8db4a005ff83d90d7e755a4dcb243556edc02470b9cb6ed2cafe6d4bd0b36d7f')
sha256sums_aarch64=('9d745127b9f584aa8f99f6854aec53de47ee42b1457f70250fbcdd6d71f7233c')

package() {
  install -Dm755 "gphotosdl" "${pkgdir}/usr/bin/gphotosdl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
