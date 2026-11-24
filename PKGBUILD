# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=1667-bin
pkgver=0.11.2
pkgrel=1
pkgdesc="Full-screen terminal environment for writing fiction with language models"
arch=('x86_64' 'aarch64')
url="https://github.com/1667-ai/1667"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/1667-ai-linux-x64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/1667-ai-linux-arm64-${pkgver}.tgz")
sha256sums_x86_64=('f09b5d6338dda841236e4d154b93228c3dba98b62285b9ead4e3b0dc14c1336f')
sha256sums_aarch64=('2aac2298a729c5cdad682e481bedc81100cfaa935885714a37e24fa7ca37cf53')

package() {
  install -Dm755 "package/bin/1667" "${pkgdir}/usr/bin/1667"
  install -Dm644 "package/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
