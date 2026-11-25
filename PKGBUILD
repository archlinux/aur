# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aistore-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="AIStore: scalable storage for AI applications"
arch=('x86_64')
url="https://github.com/NVIDIA/aistore"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/NVIDIA/aistore/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ais-linux-amd64.tar.gz")
sha256sums=('ff94bae9259bdc688e7fe9627bad82cc69e3d97dcf0f4514f1cada1c2a0c0a5b')
sha256sums_x86_64=('2459fee32ca49a5d1ff56abeeaa86d9da3fc65e7119fb73857688a235cf0c537')

package() {
  install -Dm755 "ais" "${pkgdir}/usr/bin/ais"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
