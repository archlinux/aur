# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zanadir-bin
pkgver=0.32.0
pkgrel=1
pkgdesc="CI/CD security tool that finds missing pipeline security checks"
arch=('x86_64' 'aarch64')
url="https://github.com/MustacheCase/zanadir"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zanadir_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zanadir_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8629871893917f4b44d1dd56f47b5ab51c2edf73c916b5ef9fb2edc1aef670e8')
sha256sums_aarch64=('38a1eea55bd9782792fda808bf6b01b8a3dcc79a91d7967f16301800b57fe369')

package() {
  install -Dm755 "zanadir" "${pkgdir}/usr/bin/zanadir"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
