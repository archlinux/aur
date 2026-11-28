# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=plandb-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Issue tracker for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Agent-Field/plandb"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Agent-Field/plandb/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/plandb-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/plandb-linux-aarch64")
sha256sums=('3a6f6deeb2f09ebaf3e8dc46af5327a561397dc9d59c818fb67f4669e9b40b4d')
sha256sums_x86_64=('ab9098caf13284579a8e8bc37a817f44baee73ace025a6520785a8ae175499a2')
sha256sums_aarch64=('b511296a18471fb2508997a5466feb126c44ca0311f8f67a9bd198cfc4d2fc86')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/plandb"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
