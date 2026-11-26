# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=isaiah-bin
pkgver=1.36.9
pkgrel=1
pkgdesc="Self-hosted web clone of lazydocker"
arch=('x86_64' 'aarch64')
url="https://github.com/will-moss/isaiah"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/isaiah_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/isaiah_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('d39a419fd6e37536efd566a47ff40af9d0381657ee07249dc1577954291a7ca5')
sha256sums_aarch64=('dd548bad624b765033624b8137e59eb77f9cf16dece8d0c38f32d16fefe96c4e')

package() {
  install -Dm755 "isaiah" "${pkgdir}/usr/bin/isaiah"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
