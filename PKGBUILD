# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=adsbdb-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Public API server for aircraft, airline and flight route data"
arch=('x86_64' 'aarch64')
url="https://github.com/mrjackwills/adsbdb"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mrjackwills/adsbdb/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/adsbdb_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/adsbdb_linux_aarch64.tar.gz")
sha256sums=('29bd87d6eb6b22e949bd6e5a3387ddb667ca9381d51d06d33485a0155cac155a')
sha256sums_x86_64=('3d9abc9fa6879a9816e744a22352425e01af564b7299762841cf943d5ce90bc6')
sha256sums_aarch64=('d9d3ff0ed2c2af49c8ae61c168f9bea88accbaed70252940871604baa5d09eb7')

package() {
  install -Dm755 "adsbdb" "${pkgdir}/usr/bin/adsbdb"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
