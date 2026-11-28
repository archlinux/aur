# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=helm-images-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Helm plugin that lists all images used by a chart or release"
arch=('x86_64' 'aarch64')
url="https://github.com/nikhilsbhat/helm-images"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/helm-images_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/helm-images_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3c24595b21a6e3d7b83e79fb27b2726d8a08623e7ae63af358d80c1fa52b8625')
sha256sums_aarch64=('315819085cfd7e2ebe1810c89ba0b134eeb19e397fc16411c0da44be2f60d492')

package() {
  install -Dm755 "helm-images" "${pkgdir}/usr/bin/helm-images"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
