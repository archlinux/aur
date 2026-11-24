# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tokui-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Interactive TUI for visualizing code statistics from tokei"
arch=('x86_64' 'aarch64')
url="https://github.com/zdyxry/tokui"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tokui_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tokui_linux_arm64.tar.gz")
sha256sums_x86_64=('320769010e07630a6bbe4f0b03650ef15f2a8541567526a49db66bbc36040f4b')
sha256sums_aarch64=('d8abefc92a4669c6156777a46c1446c9e04739180e340fa0e7f7bc9427c3ae05')

package() {
  install -Dm755 "tokui" "${pkgdir}/usr/bin/tokui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
