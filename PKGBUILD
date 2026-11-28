# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=goeland-bin
pkgver=0.29.2
pkgrel=1
pkgdesc="Turn RSS and Atom feeds into email digests"
arch=('x86_64' 'aarch64')
url="https://github.com/slurdge/goeland"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/slurdge/goeland/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/goeland_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/goeland_linux_arm64")
sha256sums=('5f58f9f89cccb9dbc3e358596b8215847994244110068e10553243f4f49e6780')
sha256sums_x86_64=('e80b0dd1a2d6bc951549b5098a60aa81ec299ec5cd93853de30057f7c2b03e63')
sha256sums_aarch64=('4951089b863de05eb2dfb8661baf8f24c696ac8944da8b2f1b9973007dbaf85e')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/goeland"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
