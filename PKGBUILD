# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=webhook-tester-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Test webhooks and HTTP requests"
arch=('x86_64' 'aarch64')
url="https://github.com/tarampampam/webhook-tester"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tarampampam/webhook-tester/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/webhook-tester-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/webhook-tester-linux-arm64")
sha256sums=('33566ccd8dc08ccf93dc08d080271dd49dc11a2585f57861d1d0e29f31a43af8')
sha256sums_x86_64=('bd1716479bbbfee42beca8514b0e13d1b259e63e89348cd9f8fbc2f97e1f040f')
sha256sums_aarch64=('0ddeea7f72db4a83ff6ca9c0a3a26c29be1f8a06d10d6ea285e077f39571d1d2')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/webhook-tester"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
