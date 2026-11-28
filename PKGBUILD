# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cheek-bin
pkgver=1.1.7
pkgrel=1
pkgdesc="Tiny declarative job scheduler"
arch=('x86_64' 'aarch64')
url="https://github.com/bart6114/cheek"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/bart6114/cheek/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/cheek-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/cheek-linux-arm64")
sha256sums=('2ec3f8871ef5df5e222dee18c4161a2165e6563f230714887ba8902e6b2a0ac5')
sha256sums_x86_64=('55c448daccbc076575658d7583505f0674c9f3f48dbdfd8e6c6b871aed94938d')
sha256sums_aarch64=('4724e11d3e380784b59b1c93bad0a552b4822bc0b9cb48cbd6a5a4a0f66f9e1d')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/cheek"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
