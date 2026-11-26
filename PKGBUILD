# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clickclack-bin
pkgver=0.9.5
pkgrel=1
pkgdesc="Chat app for humans and AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/openclaw/clickclack"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clickclack_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/clickclack_${pkgver}_linux_aarch64.tar.gz")
sha256sums_x86_64=('b283d60599e49d87d69bf011dc7cc4a59483f70af34721db9ba970f1cd19dfe4')
sha256sums_aarch64=('ffed716205db36b9adf0addc695bbc36c8e00ff81d1c3611f03bf816414bdd70')

package() {
  install -Dm755 "clickclack" "${pkgdir}/usr/bin/clickclack"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
