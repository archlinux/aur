# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=h-ui-bin
pkgver=0.0.26
pkgrel=1
pkgdesc="Just the panel for Hysteria2 / Hysteria2"
arch=('x86_64' 'aarch64')
url="https://github.com/jonssonyan/h-ui"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jonssonyan/h-ui/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/h-ui-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/h-ui-linux-arm64")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('aa6c32d4b7de0538598419ffeac15ee9c98d3aaf49d9fee448c8f0cbb47c52d1')
sha256sums_aarch64=('b5dfeeedb701483224460a8f7d11a6c0e256daf42f944c578c81f0fafeac0dbd')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/h-ui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
