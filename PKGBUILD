# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gcscope-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Go garbage collector visualizer TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/timur-developer/gcscope"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gcscope_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gcscope_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('77db69d8e98425bf47099c5886ad48a03095e54c222ec4e2070afff001366d3b')
sha256sums_aarch64=('d07d05fdf6f8c98a72e965051ed04c589886acacd55b7a5150d86bc923449653')

package() {
  install -Dm755 "gcscope" "${pkgdir}/usr/bin/gcscope"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
