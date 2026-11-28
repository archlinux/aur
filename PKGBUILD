# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goiabada-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="OAuth2 and OpenID Connect server"
arch=('x86_64' 'aarch64')
url="https://github.com/leodip/goiabada"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/leodip/goiabada/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/goiabada-${pkgver}-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/goiabada-${pkgver}-linux-arm64.zip")
sha256sums=('d51f2335903ef820bcbbe3cb34f94cd53344eccb9328dd349e8f26fac804ae1d')
sha256sums_x86_64=('6b8e30a527a4ea921f3a243c45ebf87ebbdc76f24dc00bf093baa81bee3bbb03')
sha256sums_aarch64=('eb4c78950f9a1098bd620fae67d23fa845432c6b876bf6cb56d4aad9ae505680')

package() {
  install -Dm755 "goiabada-authserver" "${pkgdir}/usr/bin/goiabada-authserver"
  install -Dm755 "goiabada-adminconsole" "${pkgdir}/usr/bin/goiabada-adminconsole"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
