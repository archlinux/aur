# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=govpp-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Go toolset for FD.io VPP"
arch=('x86_64')
url="https://github.com/FDio/govpp"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/FDio/govpp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/govpp_${pkgver}_linux_amd64.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('63cf1c0687510c26bc93f3f7b4e4df21bcd7894252911737becfb5ce626756e8')

package() {
  install -Dm755 "govpp_${pkgver}_linux_amd64/govpp" "${pkgdir}/usr/bin/govpp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "govpp_${pkgver}_linux_amd64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
