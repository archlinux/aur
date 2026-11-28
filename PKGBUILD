# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cam2ip-bin
pkgver=1.8.1
pkgrel=1
pkgdesc="Turn any webcam into an IP camera"
arch=('x86_64' 'aarch64')
url="https://github.com/gen2brain/cam2ip"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cam2ip-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cam2ip-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('23cb5c4e04af83ef1b677703c14c5104a0e098fd1a19a57d58084eb155948e3f')
sha256sums_aarch64=('b4bb99e8ac1e71e2ba9347de3fe0cecf5a9ad2882670439a6ec6ba6fd9fe26a6')

package() {
  install -Dm755 "cam2ip-${pkgver}/cam2ip" "${pkgdir}/usr/bin/cam2ip"
  install -Dm644 "cam2ip-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "cam2ip-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
