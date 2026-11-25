# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=jscpd-bin
pkgver=5.4.3
pkgrel=1
pkgdesc="Copy/paste detector for source code"
arch=('x86_64' 'aarch64')
url="https://github.com/kucherenko/jscpd"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/jscpd-linux-x64-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/jscpd-linux-arm64-gnu.tar.gz")
sha256sums_x86_64=('a19d719331b21a047a7537f982566dabcf6d6e5f51581c3b80d9c420979cc92c')
sha256sums_aarch64=('221a62a254ab4cc42f26e076943ca79ecd311ae41646a76a08e4b790ed8c5fbe')

package() {
  install -Dm755 "jscpd" "${pkgdir}/usr/bin/jscpd"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
