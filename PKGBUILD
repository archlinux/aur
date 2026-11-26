# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=port-buddy-bin
pkgver=1.0.18
pkgrel=1
pkgdesc="Expose local ports to the internet"
arch=('x86_64' 'aarch64')
url="https://github.com/amak-tech/port-buddy"
license=('Apache-2.0')
depends=('glibc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/amak-tech/port-buddy/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/portbuddy-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/portbuddy-linux-arm64")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('06bbd6182e77db97bc849719db806e6ef416da4a47c7e1645596854deca9e84f')
sha256sums_aarch64=('348c06f642536feff4b33b51ccb408efd271dc96682088a36b5bc8771f007059')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/portbuddy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
