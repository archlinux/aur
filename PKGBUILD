# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aspect-cli-bin
pkgver=2026.47.12
pkgrel=1
pkgdesc="Correct, fast and usable Bazel wrapper CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/aspect-build/aspect-cli"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/aspect-${pkgver}.x86_64_linux.bottle.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/aspect-${pkgver}.arm64_linux.bottle.tar.gz")
sha256sums_x86_64=('69dcc054a6c618d58d6772e2db4288da05d807f2d3cfb04556ca52ac8ff90b1e')
sha256sums_aarch64=('742e8d23995e840a931646afe72101c7cdc15876d129706062259ac9c8e35a02')

package() {
  install -Dm755 "aspect/${pkgver}/bin/aspect" "${pkgdir}/usr/bin/aspect"
  install -Dm644 "aspect/${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "aspect/${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
