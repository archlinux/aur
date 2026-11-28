# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=git-surgeon-bin
pkgver=0.1.17
pkgrel=1
pkgdesc="Git primitives for autonomous coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/raine/git-surgeon"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/raine/git-surgeon/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/git-surgeon-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/git-surgeon-linux-arm64.tar.gz")
sha256sums=('dfc0be306ac621b63914bf0f4854538a2e0a8d09ad24f20e7edd9a80ece241b2')
sha256sums_x86_64=('7bd03670ec02fd6e9e8c62e4cb69d9f85e3cb2d92976d8bc3077547bdf307db6')
sha256sums_aarch64=('c0f902befcdd05b140fcd05360daeaa5fde3aed7d492ef4131676676fe7ca908')

package() {
  install -Dm755 "git-surgeon" "${pkgdir}/usr/bin/git-surgeon"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
