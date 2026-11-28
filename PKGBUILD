# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=govalid-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Fast validation code generator for Go"
arch=('x86_64' 'aarch64')
url="https://github.com/sivchari/govalid"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/govalid_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/govalid_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('109652ca77fc46b9e9ed1e197f54d68da4fad1734bba913c91a72d1674f18768')
sha256sums_aarch64=('74416b5206d991672cc346ac77cbd5abc098fbd4bf7751b6f833aebc4718b356')

package() {
  install -Dm755 "govalid" "${pkgdir}/usr/bin/govalid"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
