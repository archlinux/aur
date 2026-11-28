# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kw1281test-bin
pkgver=1.0.10
pkgrel=1
pkgdesc="Test tool for the VW KW1281 diagnostic protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/gmenounos/kw1281test"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gmenounos/kw1281test/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/kw1281test_${pkgver}_Linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/kw1281test_${pkgver}_Linux-Arm64.zip")
sha256sums=('6643da0f8a3756988ad9505e8ad972376bc4a86acc570bdee6eb9cd0ad6a90cf')
sha256sums_x86_64=('ec44cb01244ee585d7dd822d6c47d442f8bd1796df4b37c7a3878c7041705e0b')
sha256sums_aarch64=('c8262a930efd1db4deca3c11741cdd0f635a53a3778fcad184917d1fbb339464')

package() {
  install -Dm755 "kw1281test" "${pkgdir}/usr/bin/kw1281test"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
