# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=riffpad-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="Watch, approve and steer coding agents from your phone"
arch=('x86_64' 'aarch64')
url="https://github.com/riffpad/riffpad"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/riffpad/riffpad/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/riffpad-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/riffpad-linux-arm64")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('9fa1c792636825b24ab124686dd8452ecd7192b634b5c46f7369f84492f211ee')
sha256sums_aarch64=('94171a0fc9d65e6c2a0165636006c98cd6b7b2618907946a0c8cdca6e61e9a9c')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/riffpad"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
