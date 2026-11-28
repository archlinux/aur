# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=portkey-bin
pkgver=4.0.1
pkgrel=1
pkgdesc="Simple web start page with a collection of links"
arch=('x86_64' 'aarch64')
url="https://github.com/kodehat/portkey"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/portkey-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/portkey-linux-arm64.tar.gz")
sha256sums_x86_64=('fff6b6cbf21f60cab54a9cc4d644318695c001375900690835dc5479b6ba3b86')
sha256sums_aarch64=('27a3bc814b7fc98e63c00736e4df1dcc79a023833af2316660c2cf5ef253d4d7')

package() {
  install -Dm755 "portkey" "${pkgdir}/usr/bin/portkey"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
