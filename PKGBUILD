# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ast-metrics-bin
pkgver=0.44.0
pkgrel=1
pkgdesc="Analyze code structure and complexity metrics"
arch=('x86_64' 'aarch64')
url="https://github.com/ast-metrics/ast-metrics"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ast-metrics/ast-metrics/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ast-metrics_Linux_x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ast-metrics_Linux_arm64")
sha256sums=('bff92c9773fb68f2b21f538ea9a2c7dd5bc3865b06577a141bc94f8b117fdcc1')
sha256sums_x86_64=('b1f412033425385fd4496910882d51de4192686840bda379b63be95180e2e401')
sha256sums_aarch64=('e90b26be012daa743956e47094a87b2145e23a3004c1737f8d71d317c8e2e6d1')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ast-metrics"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
