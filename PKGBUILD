# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=uncomment-bin
pkgver=3.12.1
pkgrel=1
pkgdesc="Remove comments from code in 300+ languages"
arch=('x86_64' 'aarch64')
url="https://github.com/goldziher/uncomment"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/goldziher/uncomment/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/uncomment-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/uncomment-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('fbc71a32fa422bc4a06792e544a84608cb580c45ea4ca1fd5fca4512197dd7fe')
sha256sums_x86_64=('67e89fcd7dd31273d8910944a0532ebb8b2aaa13cf7169849a39db862697e8b9')
sha256sums_aarch64=('cbb5b32d4f0f5ec3a5a50ffdfc735003023132be19f5163c27ead679ac08f7cf')

package() {
  install -Dm755 "uncomment" "${pkgdir}/usr/bin/uncomment"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
