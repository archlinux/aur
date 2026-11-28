# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=slothdb-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Experimental embedded SQL engine"
arch=('x86_64')
url="https://github.com/SouravRoy-ETL/slothdb"
license=('MIT')
depends=('glibc' 'libgcc' 'libgomp' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/SouravRoy-ETL/slothdb/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/slothdb-linux-x64")
sha256sums=('654091f14d955ea04fee3d78c7e0d6a2c7b55851df0ecd7c0f1be0d8a7f2799f')
sha256sums_x86_64=('6976509996e486aa3b2044dde222e759e02b7a2f13b1a068b6eefdf59bfbd3f0')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/slothdb"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
