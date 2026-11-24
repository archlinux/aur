# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dprs-bin
pkgver=0.1.15
pkgrel=1
pkgdesc="TUI for managing Docker containers and following their logs"
arch=('x86_64' 'aarch64')
url="https://github.com/durableprogramming/dprs"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/durableprogramming/dprs/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64-dplw::${_dl}/dplw-x86_64-unknown-linux-musl"
            "${pkgname}-${pkgver}-x86_64-dprs::${_dl}/dprs-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64-dplw::${_dl}/dplw-aarch64-unknown-linux-musl"
            "${pkgname}-${pkgver}-aarch64-dprs::${_dl}/dprs-linux-arm64")
sha256sums=('34189015685b6e849c2e32517819bca5879693b72586525f56e334f94cd8d504')
sha256sums_x86_64=('216277b4c61b30f62590c37845f1ca2bd09225009b332074ae10b4edba977c5e'
                   '2e6702da15fc02730609370676c96d80a5cb0537c8af8a470d1344c6698b2858')
sha256sums_aarch64=('59661c6401d681ef4729cfc332d3a114cff447098b012fd9144fb8fc79240c2f'
                    '1c1a8f74b19e785a2158838e24fea7dabf5da6fecda7833b218e17ade43957e6')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}-dplw" "${pkgdir}/usr/bin/dplw"
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}-dprs" "${pkgdir}/usr/bin/dprs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
