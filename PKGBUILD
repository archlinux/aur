# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cottenrouter-bin
pkgver=1.2.26
pkgrel=1
pkgdesc="Route many DNS tunnels through one public port 53"
arch=('x86_64' 'aarch64')
url="https://github.com/TaJirax/CottenRouter"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/TaJirax/CottenRouter/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/cottenrouter-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/cottenrouter-linux-arm64")
sha256sums=('763dd5b29cc5e9825f4cc0591ae4d2f2e989dbe9e62c7cac16beba8eb0ac1f51')
sha256sums_x86_64=('b31eb7b44e04d753df5399aa6ed0db143b75089d75ba94ab03c075c055bd25cc')
sha256sums_aarch64=('7ed78ddaa428ed089e9e74dd5254fccdf1c0721d1326236a9be9f644c21f2d34')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/cottenrouter"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
