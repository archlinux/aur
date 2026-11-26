# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=threatcl-bin
pkgver=0.6.14
pkgrel=1
pkgdesc="Document threat models with HCL"
arch=('x86_64' 'aarch64')
url="https://github.com/threatcl/threatcl"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/threatcl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/threatcl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2d7ad88dca69f3e7318db7d089b6a348d497adbf352fd10664ba8d26c0e08c44')
sha256sums_aarch64=('4f57398a5b5ab7b399f0df623f7ab96955e6617cafd13355637e5c24566036cf')

package() {
  install -Dm755 "threatcl" "${pkgdir}/usr/bin/threatcl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
