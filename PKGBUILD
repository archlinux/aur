# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jshunter-bin
pkgver=0.8
pkgrel=1
pkgdesc="Analyze JavaScript files and extract endpoints"
arch=('x86_64')
url="https://github.com/cc1a2b/JShunter"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/cc1a2b/JShunter/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/jshunter_linux_amd64")
sha256sums=('4c60f230e38c8096ee5d21d2b8e109b4d5cc851fa6e79770019711abc2794267')
sha256sums_x86_64=('871da328b4d045d555a3d03b2f8e61decfe0a5160fae7cd3bde5ded4c5859437')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/jshunter"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
