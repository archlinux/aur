# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rayforce-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="SIMD-accelerated columnar analytics database"
arch=('x86_64')
url="https://github.com/RayforceDB/rayforce"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rayforce-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('ea20fd48a223ffb3ed3e37a5edcb8a7caf5c5199d4cc8ba4e072d0c21e4a57b7')

package() {
  install -Dm755 "rayforce-${pkgver}-linux-x86_64/rayforce" "${pkgdir}/usr/bin/rayforce"
  install -Dm644 "rayforce-${pkgver}-linux-x86_64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "rayforce-${pkgver}-linux-x86_64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
