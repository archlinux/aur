# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bartholomew-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Micro-CMS for WebAssembly and Spin"
arch=('x86_64' 'aarch64')
url="https://github.com/fermyon/bartholomew"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fermyon/bartholomew/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bart-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bart-v${pkgver}-linux-aarch64.tar.gz")
sha256sums=('8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac')
sha256sums_x86_64=('68d74e3382e23b25f83ab900c96b7ec3f2a43d7bff8c1756bf0bb99ea8b1acc6')
sha256sums_aarch64=('d9370646c5b8922f53cae1dfa4c840e71c4eb36451627f3735b3e10c6ca6375a')

package() {
  install -Dm755 "bart" "${pkgdir}/usr/bin/bart"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
