# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aptui-bin
pkgver=1.0.0
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
sha256sums_x86_64=('8483acbb421562dca8bab1b2d5745971d3a238c46c37bb8807c12d7defef7e67')
sha256sums_aarch64=('5baf0eef7f4376b0be64de477dc82d48212c15570c1a82be0d184e37a19f0f1c')

package() {
  install -Dm755 "aptui" "${pkgdir}/usr/bin/aptui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
