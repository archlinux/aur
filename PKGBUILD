# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bagel-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Inventory security-relevant metadata on developer workstations"
arch=('x86_64' 'aarch64')
url="https://github.com/boostsecurityio/bagel"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bagel_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bagel_Linux_arm64.tar.gz")
sha256sums_x86_64=('491c5f2cf309607bb45ec541ec4a7b9d366e45ce01c455fd7fc116a8e71bd3db')
sha256sums_aarch64=('eb5cadafa24daccd2241fd6d7b98259cf1c6e8682d96f813ce7ffbb45121c5c9')

package() {
  install -Dm755 "bagel" "${pkgdir}/usr/bin/bagel"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
