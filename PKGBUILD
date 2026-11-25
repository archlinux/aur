# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sslip.io-bin
pkgver=6.2.0
pkgrel=1
pkgdesc="DNS server that resolves hostnames with embedded IP addresses to those addresses"
arch=('x86_64' 'aarch64')
url="https://github.com/cunnie/sslip.io"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cunnie/sslip.io/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/sslip.io-dns-server-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/sslip.io-dns-server-linux-arm64")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('9eab2bd93844d640362db8d4a434a993ff54e4170d30c5da08c99bd457a86f0a')
sha256sums_aarch64=('bbd0750428b40e6778b10303629fcf5c26f185891376729b10ac46dacb238f33')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/sslip.io-dns-server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
