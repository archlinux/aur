# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=xsd2go-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Generate Go XML parsers from XSD schemas"
arch=('x86_64' 'aarch64')
url="https://github.com/GoComply/xsd2go"
license=('Unlicense')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/xsd2go_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/xsd2go_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('59e640289dcf796c1241e821f7cba3419e0ef47bbb96b66c0f21cddb3b49f081')
sha256sums_aarch64=('790e1bcec7b2b0b526a76f732c63eb496606f3b1255a747febe662e7e05217f7')

package() {
  install -Dm755 "gocomply_xsd2go" "${pkgdir}/usr/bin/gocomply_xsd2go"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
