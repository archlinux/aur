# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pear-bin
pkgver=3.7.0
pkgrel=1
pkgdesc="Peer-to-peer install and deploy CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/holepunchto/pear"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/holepunchto/pear/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/pear-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/pear-linux-arm64.zip")
sha256sums=('cf90d659de5c1e6418267ab8043b756e65508ee5d8d50b29eb2d2fe444c2c3eb')
sha256sums_x86_64=('14d41c16edf14b05cf08e19c744393917f1b102add9d00df3836eda0ac230079')
sha256sums_aarch64=('c37470538652baf25541daec84bfa3601bdd165cdbb08ade6ed9e7a626557bd9')

package() {
  install -Dm755 "pear" "${pkgdir}/usr/bin/pear"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
