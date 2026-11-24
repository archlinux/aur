# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ls-horizons-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Terminal UI for visualizing NASA's Deep Space Network in real time"
arch=('x86_64')
url="https://github.com/litescript/ls-horizons"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ls-horizons-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('f554ca478657fdb9efbb0cdc8dfb85f3330a60897cf777cfef3e93be49a1c956')

package() {
  install -Dm755 "ls-horizons-v${pkgver}-linux-amd64/ls-horizons" "${pkgdir}/usr/bin/ls-horizons"
  install -Dm644 "ls-horizons-v${pkgver}-linux-amd64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
