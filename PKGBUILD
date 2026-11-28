# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=getnote-cli-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="Command-line client for the Get Notes app, for humans and AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/iswalle/getnote-cli"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/iswalle/getnote-cli/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/getnote-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/getnote-cli_${pkgver}_linux_arm64.tar.gz")
sha256sums=('e4f2c00f20e17094a2de1e4a770cdd97068eb6d815abd3b98b376c383c75638d')
sha256sums_x86_64=('e9996a635fcb6750457985bd7440643cf812550e6799891463ae48cd1307ee29')
sha256sums_aarch64=('8edf9fa49f340c58d3c54face78816132327983603ab1779f765d84f760b88a3')

package() {
  install -Dm755 "getnote" "${pkgdir}/usr/bin/getnote"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
