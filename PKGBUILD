# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rememory-bin
pkgver=0.0.23
pkgrel=1
pkgdesc="Digital safe with multiple keys held by people you trust"
arch=('x86_64' 'aarch64')
url="https://github.com/eljojo/rememory"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/eljojo/rememory/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/rememory-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/rememory-linux-arm64")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('8a5d50029225bb1752b5d829c6d4e75d4de5e3a50cc74475a86e2de0ace10cfe')
sha256sums_aarch64=('38fe314dcaad9709342ded169db557afc4b6ea495bfbdf01372dc8ca050ca0a7')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/rememory"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
