# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tstrip-bin
pkgver=0.6.5
pkgrel=1
pkgdesc="Scrollable-tiling terminal multiplexer inspired by niri"
arch=('x86_64' 'aarch64')
url="https://github.com/dip-bash/tstrip"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dip-bash/tstrip/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/tstrip-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/tstrip-linux-aarch64")
sha256sums=('f22b3e59f84b7afee6e1341a2f8e0d928ff685c7111e78a2ff4e30ce501d2209')
sha256sums_x86_64=('e4e093c34328a256324201c81404810c7850d037d8a966615f8c170258de12df')
sha256sums_aarch64=('49edfee27098cb36cb5da69dcb24c3eac2805b35e3945d1111d2911b99ce961a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tstrip"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
