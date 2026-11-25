# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cam2ip-bin
pkgver=1.8.0
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
sha256sums_x86_64=('109cad231799ae85fa0933acad93d28d1fad286881a3c84e1fd9496ded720e95')
sha256sums_aarch64=('c174364eb50e824c21b6ade48a45e422904428e2aa4362bda16c16b9d4fcb527')

package() {
  install -Dm755 "cam2ip-${pkgver}/cam2ip" "${pkgdir}/usr/bin/cam2ip"
  install -Dm644 "cam2ip-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "cam2ip-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
