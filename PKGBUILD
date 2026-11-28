# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gnmi-gateway-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Distributed network telemetry service for OpenConfig and gNMI"
arch=('x86_64' 'aarch64')
url="https://github.com/openconfig/gnmi-gateway"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/openconfig/gnmi-gateway/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/gnmi-gateway-v${pkgver}-linux-amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/gnmi-gateway-v${pkgver}-linux-arm64.zip")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('0276a084514f328c97a6f4458819a4a736dc6d6c63dc98837b9452dca622cdd5')
sha256sums_aarch64=('8af69e11690a639674891c4542c84622f49f9546ac7fb11813ec99a80f0be3dd')

package() {
  install -Dm755 "gnmi-gateway" "${pkgdir}/usr/bin/gnmi-gateway"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
