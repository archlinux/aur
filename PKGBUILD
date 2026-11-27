# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=1667-bin
pkgver=0.11.3
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
sha256sums_x86_64=('0bcc500e3d0ddb5708883f8270895422dcbc358272f5948ac3874783af9292e6')
sha256sums_aarch64=('68627ea8a7e964c589f2049ecce493f3137acbfeacdf602994a7f47e31e49413')

package() {
  install -Dm755 "package/bin/1667" "${pkgdir}/usr/bin/1667"
  install -Dm644 "package/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
