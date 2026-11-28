# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=perles-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Terminal UI kanban and query tool for Beads issue tracking"
arch=('x86_64' 'aarch64')
url="https://github.com/zjrosen/perles"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/perles_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/perles_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b111a143cf79e6da307f5b254777cc5ed930ec50c380fd29127655849a8ef96d')
sha256sums_aarch64=('52822a14cdbc63cfea62c6f12ebf688145b93763f0e25fd6822271f814b88b22')

package() {
  install -Dm755 "perles" "${pkgdir}/usr/bin/perles"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
