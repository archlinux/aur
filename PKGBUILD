# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=csv2xlsx-bin
pkgver=0.5.7
pkgrel=1
pkgdesc="Convert CSV files to XLSX"
arch=('x86_64' 'aarch64')
url="https://github.com/mentax/csv2xlsx"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/csv2xlsx_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/csv2xlsx_Linux_arm64.tar.gz")
sha256sums_x86_64=('3a99afe412e5d5e7c8a3fea70f3ca4a2d7f20aeb589fa992c5915539030f6a69')
sha256sums_aarch64=('4a3c54d994ad15f3066e9e17aed526bc33909bcbfac423ea0a0bd0af426971ef')

package() {
  install -Dm755 "csv2xlsx" "${pkgdir}/usr/bin/csv2xlsx"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
