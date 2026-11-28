# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bitloops-bin
pkgver=0.0.31
pkgrel=1
pkgdesc="Context engine for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/bitloops/bitloops"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/bitloops/bitloops/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bitloops-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bitloops-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('b22a00de88ee37fdd20081ca52baeba41c63e1a9c8cc99774b168169ddf54595')
sha256sums_x86_64=('219c3e5a215c8d9ef9ba78f786cfe37d1d39328bcf9a4df26c7e059ebebf40a8')
sha256sums_aarch64=('0ed4a0ca0ce7591ec6a95c3399ca6eb2f585625f57ba6798800866d1ff4581d8')

package() {
  install -Dm755 "bitloops" "${pkgdir}/usr/bin/bitloops"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
