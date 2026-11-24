# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pitago-bin
pkgver=0.12.5
pkgrel=1
pkgdesc="TUI for the pi coding agent"
arch=('x86_64')
url="https://github.com/cavaldos/pitago"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cavaldos/pitago/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/pitago-v${pkgver}-linux-amd64")
sha256sums=('aabedb047225837f53febe31a6f538aa6dd5f801c17dd7f966411e8c3a40b58d')
sha256sums_x86_64=('1e5aeb5e8df958c2a5b6b6e6e8f96a710b8f9aa7ca33fe46bf9d2980ece98cb9')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/pitago"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
