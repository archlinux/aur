# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=decypharr-bin
pkgver=2.7.2
pkgrel=1
pkgdesc="Media gateway for Debrid and Usenet services"
arch=('x86_64' 'aarch64')
url="https://github.com/sirrobot01/decypharr"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sirrobot01/decypharr/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/decypharr_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/decypharr_Linux_arm64.tar.gz")
sha256sums=('e1847a2555d252d676309ea472eedb5b1fa4cadd93a55c7409cd2a3568011fb6')
sha256sums_x86_64=('142a1828701ee2cfa2653436776a9ac4de2d63660bd456f857b84f209284d93e')
sha256sums_aarch64=('3f28168d26e10505d0074f760c7a831bf7309b277650fad7ddef8b2405e2a41c')

package() {
  install -Dm755 "decypharr" "${pkgdir}/usr/bin/decypharr"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
