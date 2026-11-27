# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ch-ui-bin
pkgver=2.34.0
pkgrel=1
pkgdesc="Self-hosted web interface for ClickHouse"
arch=('x86_64' 'aarch64')
url="https://github.com/caioricciuti/ch-ui"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/caioricciuti/ch-ui/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ch-ui-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ch-ui-linux-arm64")
sha256sums=('f8334209415bdab2f5d7da244532dfe6e04dd587bbaa0829c63e3d144ec76f66')
sha256sums_x86_64=('2c66f6941bfce722c0917c040b7b5f41ab6f7b16c24df035fdeea2d44f9ee485')
sha256sums_aarch64=('7e03f99ed571fedcae61c394e0c52920078571263951d82b460a973440a612c6')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ch-ui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
