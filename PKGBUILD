# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ch-ui-bin
pkgver=2.33.1
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
sha256sums_x86_64=('fa0c98db3e71236d5e4906c67c73f3fbf3e617758d92ff0e8d28867c77472fd1')
sha256sums_aarch64=('9565c4368b479195133e9844d900c208a4b5ed16ffde8bc2543881b47ee0550f')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ch-ui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
