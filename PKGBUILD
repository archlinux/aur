# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=remindb-bin
pkgver=0.3.12
pkgrel=1
pkgdesc="Agent memory database in one portable SQLite file"
arch=('x86_64' 'aarch64')
url="https://github.com/radimsem/remindb"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/remindb_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/remindb_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('ad9524ff35aef235e0d686ca02e85d8dec72d3503930fbfd9c7aa21d6fc8bf8d')
sha256sums_aarch64=('703fb66f61465744d446232fdb7e83cfdcc6425410ad791cb19daaf284d03bfd')

package() {
  install -Dm755 "remindb" "${pkgdir}/usr/bin/remindb"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
