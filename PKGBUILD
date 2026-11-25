# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tstrip-bin
pkgver=0.6.0
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
sha256sums_x86_64=('76f52c95da097a12b69ca304c4cefe2b789de6861a6b51ff236ab9f4205bc783')
sha256sums_aarch64=('b9795dd0157f7facf5ab79de472f85ba9dce16e5aa70257f2200b0164675ad36')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tstrip"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
