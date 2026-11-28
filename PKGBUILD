# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=1667-bin
pkgver=0.11.5
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
sha256sums_x86_64=('bb37e0aafd32bc0df5be2c73c26acced26552a6706dab199395afce08a5e1962')
sha256sums_aarch64=('75bf996914a52bd223624b18ae77ff40fabdfdbdb932b2cf478f9c0836ddbca1')

package() {
  install -Dm755 "package/bin/1667" "${pkgdir}/usr/bin/1667"
  install -Dm644 "package/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
