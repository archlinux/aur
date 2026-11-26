# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dirge-bin
pkgver=0.27.1
pkgrel=1
pkgdesc="Intent resolution and grounding engine for AI coding agents"
arch=('x86_64')
url="https://github.com/dirge-code/dirge"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dirge-code/dirge/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dirge-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('c3d84917d6f2d07a4221fcf15981b8165f9acf4ae870146dfeb3e10845ed77b5')

package() {
  install -Dm755 "dirge" "${pkgdir}/usr/bin/dirge"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
