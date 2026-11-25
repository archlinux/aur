# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=token-monitor-tui-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Terminal dashboard and rate-limit scheduler for AI coding subscriptions and token ledgers"
arch=('x86_64')
url="https://github.com/xzy9565/token-monitor"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/token-monitor-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('564bacff2276bc56d2ff1226d336093a6e9959b58f13b4d18726fa9af0ec7403')

package() {
  install -Dm755 "token-monitor" "${pkgdir}/usr/bin/token-monitor"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
