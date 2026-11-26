# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=crosslink-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="LLM API gateway with load balancing, failover, rate limiting, budgets and caching"
arch=('x86_64' 'aarch64')
url="https://github.com/HotRiceNoodles/CrossLink"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/crosslink_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/crosslink_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0e126507e59c5ce77a794c40a1e3398af1937f42522fb7a7a01ea21ad6278e45')
sha256sums_aarch64=('433dc7c4c1926d34353a4b589f5b516cd6c535251c45806c9fdef44c82066e86')

package() {
  install -Dm755 "crosslink" "${pkgdir}/usr/bin/crosslink"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
