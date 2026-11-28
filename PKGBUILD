# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=singleserver-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Run all your projects on a single server"
arch=('x86_64' 'aarch64')
url="https://github.com/dvassallo/singleserver"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dvassallo/singleserver/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/singleserver-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/singleserver-linux-arm64")
sha256sums=('bf1b8265ffede879f90ce55440c13dac0810a3b155385decc868218e111b0f84')
sha256sums_x86_64=('ec0bb5d67545b5f8c20997f64aeb4e8eaf45ab386976e03772e6f94c050ac4a7')
sha256sums_aarch64=('4eaa3c243b64b60c5ca49f2537ef750dae591f19920297e4fc294418674a0de5')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/singleserver"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
