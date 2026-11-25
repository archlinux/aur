# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oxidns-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="Programmable DNS server with pipeline-based routing"
arch=('x86_64' 'aarch64')
url="https://github.com/svenshi/oxidns"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/oxidns-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/oxidns-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('24ca4c18781db220901542524279cc9fe8ec3a298a8d7c284c80e6c873a71341')
sha256sums_aarch64=('bb18f32821fb6b18541195e3e43e20b162a7fe70a6b49719a7bfb9036b74fd39')

package() {
  install -Dm755 "oxidns" "${pkgdir}/usr/bin/oxidns"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
