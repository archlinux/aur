# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mermerd-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Create Mermaid ERD diagrams from existing database tables"
arch=('x86_64' 'aarch64')
url="https://github.com/KarnerTh/mermerd"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mermerd_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mermerd_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('20d2f052e34f23dc0b0094fd964bd729b35d6331df41666a7fd5c37e278a1e90')
sha256sums_aarch64=('085b4fb29b94847117c67b9cf5629454362b38ca2ddf68da93719f9d7c88fa32')

package() {
  install -Dm755 "mermerd" "${pkgdir}/usr/bin/mermerd"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "readme.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
