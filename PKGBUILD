# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=herdr-bar-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Fuzzy tab jumping and automatic tab titles for herdr"
arch=('x86_64' 'aarch64')
url="https://github.com/jeffarese/herdr-bar"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jeffarese/herdr-bar/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/herdr-bar-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/herdr-bar-linux-aarch64")
sha256sums=('419fe6a868a6b8cbbf364023506960dd97dcc28b288d53d9d28f9be5e6630fad')
sha256sums_x86_64=('7f05aada8fe064cae004322a0a40d44a48a962cb4ca50b2d89aacc3ba50845b0')
sha256sums_aarch64=('0514b3a399dbddc04016aa4e6664a835cdda34e830356e5ae5eefbdc0042a38c')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr-bar"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
