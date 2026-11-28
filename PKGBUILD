# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bivac-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="Backup interface for volumes attached to containers"
arch=('x86_64')
url="https://github.com/camptocamp/bivac"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/camptocamp/bivac/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/bivac_${pkgver}_linux_amd64.zip")
sha256sums=('c71ebd6f1eed65f8522b9ce8d88dd899d42126ad9e2ca77877bc8774258130d0')
sha256sums_x86_64=('54266bef392d59c06746264884c55ffbdce3381bfbc62ccdfe65153df9a1b9c1')

package() {
  install -Dm755 "bivac" "${pkgdir}/usr/bin/bivac"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
