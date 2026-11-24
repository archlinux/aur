# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cy-bin
pkgver=1.12.1
pkgrel=1
pkgdesc="Terminal multiplexer that records and replays sessions"
arch=('x86_64')
url="https://github.com/cfoust/cy"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cy_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('d8ca301a7257052ca54f136f0461139e1390dfb110e14539b7054b6b47cc5a09')

package() {
  install -Dm755 "cy" "${pkgdir}/usr/bin/cy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
