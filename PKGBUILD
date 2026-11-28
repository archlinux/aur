# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gofofa-bin
pkgver=0.2.29
pkgrel=1
pkgdesc="Command-line tool for the FOFA API"
arch=('x86_64' 'aarch64')
url="https://github.com/FofaInfo/GoFOFA"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fofa_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fofa_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b6c672ce2b4c4337d7d244f99dd959173e58d9c9a731d3f2f48ca968ac413502')
sha256sums_aarch64=('62970b0c1d9e8e659b09493a8f49b9d0b3a9fce5020b3ac22eb9f4f72c970455')

package() {
  install -Dm755 "fofa" "${pkgdir}/usr/bin/fofa"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
