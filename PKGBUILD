# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agentmanager-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Detect, install, manage and update AI agent CLI tools"
arch=('x86_64')
url="https://github.com/kevinelliott/agentmanager"
license=('MIT')
depends=('glib2' 'glibc' 'gtk3' 'libayatana-appindicator')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agentmanager_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('173e931715fc395f88d70123e95126c3c5b275b1906ec23ea20abd540b01d279')

package() {
  install -Dm755 "agentmgr" "${pkgdir}/usr/bin/agentmgr"
  install -Dm755 "agentmgr-helper" "${pkgdir}/usr/bin/agentmgr-helper"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
