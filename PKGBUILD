# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mtui-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="A terminal client for Modbus industrial devices"
arch=('x86_64' 'aarch64')
url="https://github.com/inowattio/mtui"
license=('GPL-2.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/inowattio/mtui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/mtui-v${pkgver}-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/mtui-v${pkgver}-aarch64-unknown-linux-gnu")
sha256sums=('8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_x86_64=('2e5c069b78899b3bba8cc1ae82167ed76fefadb918552c275dd9426b3efe3257')
sha256sums_aarch64=('4f6b33a8c17885cdbf182ef35f4e072d25f04f2983e840a47a51073bbc12459f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mtui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
