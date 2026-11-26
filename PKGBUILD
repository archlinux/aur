# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=samloader-rs-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Samsung firmware download and flash tool"
arch=('x86_64' 'aarch64')
url="https://github.com/topjohnwu/samloader-rs"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/topjohnwu/samloader-rs/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/samloader-v${pkgver}-linux-x86_64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/samloader-v${pkgver}-linux-aarch64.zip")
sha256sums=('2ea3de1fafacdfc925bc8bd63ae70cf6df2a622a8aef0d1c4b6b3e23256c4a9d')
sha256sums_x86_64=('f6029dcce75b8a66acc1975529085c53903f7cdb35505e0ac0a973f2652480ff')
sha256sums_aarch64=('c17addb7693adc4a5f6b52eb2aa27a3398433ded980319b9dcd3cd9f7a6d267e')

package() {
  install -Dm755 "samloader" "${pkgdir}/usr/bin/samloader"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
