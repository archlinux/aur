# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wwhrd-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Check Go dependency licenses against allow and deny lists"
arch=('x86_64')
url="https://github.com/frapposelli/wwhrd"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wwhrd_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('59aa6f71c6d71f3780e76a8baaf8c1070dbd4c15b86cac6704e3e14da3d95af6')

package() {
  install -Dm755 "wwhrd" "${pkgdir}/usr/bin/wwhrd"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
