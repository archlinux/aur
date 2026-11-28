# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=webctl-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Web search CLI for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/dorkitude/webctl"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/webctl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/webctl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2f50bd96d9ceac91a4c85671627cd3c0e602958fcd5c615e9a2c631df57619f0')
sha256sums_aarch64=('246add120d5ef500402f8c870de0294d8515b5ff249802d64fed30551f544601')

package() {
  install -Dm755 "webctl" "${pkgdir}/usr/bin/webctl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
