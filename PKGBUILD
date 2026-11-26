# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rfxgen-bin
pkgver=5.0
pkgrel=1
pkgdesc="Simple and easy-to-use sound effects generator"
arch=('x86_64')
url="https://github.com/raysan5/rfxgen"
license=('Zlib')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/rfxgen_v${pkgver}_linux_x64.zip")
sha256sums_x86_64=('e53dda7caab55d7b42568a1abf2e608631dce7f6d539070ece17595ce8d2f77c')

package() {
  install -Dm755 "rfxgen_v${pkgver}_linux_x64/rfxgen" "${pkgdir}/usr/bin/rfxgen"
  install -Dm644 "rfxgen_v${pkgver}_linux_x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "rfxgen_v${pkgver}_linux_x64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
