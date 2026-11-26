# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=iso8583-bin
pkgver=0.26.5
pkgrel=1
pkgdesc="Marshal and unmarshal ISO 8583 messages"
arch=('x86_64')
url="https://github.com/moov-io/iso8583"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/moov-io/iso8583/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/iso8583-linux-amd64")
sha256sums=('3c96c0da3de9587c2062f25bc7efccba795f81dbf1b08dc71652c856e88b01a8')
sha256sums_x86_64=('2bd8ceb43d12b387b6765b37dc17539c709ff5d210bc08094f92d1bf3a76af1b')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/iso8583"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
