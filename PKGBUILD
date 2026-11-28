# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=seasonpackarr-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="autobrr companion that hardlinks existing episodes into season pack folders"
arch=('x86_64' 'aarch64')
url="https://github.com/nuxencs/seasonpackarr"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nuxencs/seasonpackarr/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/seasonpackarr_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/seasonpackarr_${pkgver}_linux_arm64.tar.gz")
sha256sums=('f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505')
sha256sums_x86_64=('dfd3aa35ac287e34b1cbf1e9360ec0c761ab27739384684b44bfc86763c19f1b')
sha256sums_aarch64=('a90117b854dff8fe55fa5b34e12a5d5eeeef27f4e619595b7d0893ff2af532df')

package() {
  install -Dm755 "seasonpackarr" "${pkgdir}/usr/bin/seasonpackarr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
