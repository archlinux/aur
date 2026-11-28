# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=babysmash-bin
pkgver=4.3.0
pkgrel=1
pkgdesc="Keyboard-smashing game for small kids"
arch=('x86_64')
url="https://github.com/shanselman/babysmash"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/shanselman/babysmash/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/BabySmash-linux-x64.tar.gz")
sha256sums=('85da954b2126bf58d365bdfe5a6c8b2c42eab93465417be1e046bac87a87d253')
sha256sums_x86_64=('8d3b1f5cd29a1119ac3f9d873557d5f75861a6c65aac3dd93fd3a44922e99f77')

package() {
  install -Dm755 "./babysmash" "${pkgdir}/usr/bin/babysmash"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
