# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mtui-bin
pkgver=1.11.0
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
sha256sums_x86_64=('0e3cd8fc712e4550e266817539cd98831fa0322f46edabd5f74df74be080ddb1')
sha256sums_aarch64=('6ba2ef06df2baabb866b3b1aec880cc26c1ba1e4c3a796ef924dc82867a51c9f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mtui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
