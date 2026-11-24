# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=portview-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="List listening ports and their processes"
arch=('x86_64' 'aarch64')
url="https://github.com/mapika/portview"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mapika/portview/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/portview-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/portview-linux-aarch64.tar.gz")
sha256sums=('f660e7620ff45e138c1eb3adb59dfd21a02283248f4dc6ff6b12c0d6c538e57c')
sha256sums_x86_64=('3cb79f81ff75a3f11c3d955b87993486ab8a9b0e0ecc331fcc15ff01fd5947ce')
sha256sums_aarch64=('eb3077a0e30086b26debf7aab2efd84471471d429c90e2cabe36cf053403aa30')

package() {
  install -Dm755 "portview" "${pkgdir}/usr/bin/portview"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
