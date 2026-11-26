# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mixin-bin
pkgver=0.16.10
pkgrel=1
pkgdesc="Reference implementation of the Mixin BFT-DAG network"
arch=('x86_64')
url="https://github.com/MixinNetwork/mixin"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/MixinNetwork/mixin/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.bz2::${_dl}/mixin-linux-x64-v${pkgver}.tar.bz2")
sha256sums=('8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
sha256sums_x86_64=('09ab5389a789a97575d79dc6f8b84712d209f554bf11b5173eb3e24faa5ff47e')

package() {
  install -Dm755 "mixin-linux-x64-v${pkgver}/mixin" "${pkgdir}/usr/bin/mixin"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
