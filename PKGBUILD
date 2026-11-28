# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rewinged-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Self-hosted winget package source"
arch=('x86_64')
url="https://github.com/jantari/rewinged"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/rewinged_${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('6ad47f8b5731a192d715fb09e78a5cc93c30515ba581c29df1026ecfe5006d81')

package() {
  install -Dm755 "rewinged" "${pkgdir}/usr/bin/rewinged"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
