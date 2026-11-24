# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=abacus-tui-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Interactive terminal UI for visualizing and navigating Beads issue tracking projects"
arch=('x86_64' 'aarch64')
url="https://github.com/ChrisEdwards/abacus"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'abacus-git')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/abacus_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/abacus_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('66e1b6740a4e47e278f6bfa53dc13ad27eaa81f390944e478beb8f76e9c44835')
sha256sums_aarch64=('0aa5c244ca7d6d55ba4b85d877f1c77f4b0cd3b638d15e1135f988908e5c953c')

package() {
  install -Dm755 "abacus" "${pkgdir}/usr/bin/abacus"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
