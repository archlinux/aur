# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=souin-bin
pkgver=1.7.10
pkgrel=1
pkgdesc="RFC-compliant HTTP cache server"
arch=('x86_64' 'aarch64')
url="https://github.com/darkweak/souin"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/darkweak/souin/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/souin_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/souin_Linux_arm64.tar.gz")
sha256sums=('645c5f444195957ad4d97d74125205f9c57de47df3d0b67eae42108bb44ee276')
sha256sums_x86_64=('13cfcede154298984dbef59f07433fa1ed72e08e9710cf189b531f1005061d33')
sha256sums_aarch64=('03ecf2e56c6a576a31e9074bb0fb64fc1a541c54488fd951b403a1fc90ef18ee')

package() {
  install -Dm755 "souin" "${pkgdir}/usr/bin/souin"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
