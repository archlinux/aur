# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=octo-agent-bin
pkgver=1.17.24
pkgrel=1
pkgdesc="Self-hosted AI agent in a single binary"
arch=('x86_64' 'aarch64')
url="https://github.com/open-octo/octo-agent"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/octo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/octo_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('72043ac4747587a4dc37675b6b903edeb28e88dc8de36e33d8bdad52fbf38365')
sha256sums_aarch64=('bf6b6f111eed68a139d7481565da95ac4c257c01a9f19bcc8ddbe514bd5e8561')

package() {
  install -Dm755 "octo" "${pkgdir}/usr/bin/octo"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
