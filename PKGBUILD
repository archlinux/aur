# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=qrypad-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="SQL scratchpad for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/wheelibin/qrypad"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/qrypad_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/qrypad_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('148af92ac2d455f900a82c880f16123dd5f1143fb4fcbbf9a72054f6eaee75da')
sha256sums_aarch64=('2214d381833353169549cb5474ae58ade91e917c7cb8c8101105d1202daae73c')

package() {
  install -Dm755 "qrypad" "${pkgdir}/usr/bin/qrypad"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
