# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aptui-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="TUI package manager for APT-based distributions"
arch=('x86_64' 'aarch64')
url="https://github.com/mexirica/aptui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/aptui_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/aptui_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5d24e954200e71eec645bc4878fd84064c430e74b03ba7f8bb501fbbd2581c50')
sha256sums_aarch64=('e386e3475467c8cdcb5071a60b9e9d5059393dfa7d272714bba9b46d77842816')

package() {
  install -Dm755 "aptui" "${pkgdir}/usr/bin/aptui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
