# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openkanban-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="TUI kanban board for orchestrating AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/TechDufus/openkanban"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openkanban_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openkanban_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fd7c1d1a46ea1d5b1db890e18b38b747d3ec1e3bae3f50b62b15eefbc2e0aacb')
sha256sums_aarch64=('9ae883c65b07c06166ebeb25d940f7847c6b142de1016d9f7fd75e33f6a3d338')

package() {
  install -Dm755 "openkanban" "${pkgdir}/usr/bin/openkanban"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
