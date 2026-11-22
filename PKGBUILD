# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=yscan-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A TUI-first network scanner with ARP, mDNS, and SSDP discovery"
arch=('x86_64' 'aarch64')
url="https://github.com/yetidevworks/yscan"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/yetidevworks/yscan/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/yscan-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/yscan-linux-aarch64.tar.gz")
sha256sums=('6a546e3c5311c3d00eff8e8ccc190701aaab88c57fe180093d819ace9c3ad2a0')
sha256sums_x86_64=('847a35b6c6d2089e2be0cf734da9cd84bdf2c8bd4854370c0d2f5a2780e71ba2')
sha256sums_aarch64=('d55977f26e5fffaec1b269d66eae8c23a3a96138a650afba33dc124bb124cfda')

package() {
  install -Dm755 "yscan" "${pkgdir}/usr/bin/yscan"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
