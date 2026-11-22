# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ygrep-tui-bin
pkgver=4.0.4
pkgrel=1
pkgdesc="A fast, local, indexed code-search tool with a TUI for AI coding assistants"
arch=('x86_64' 'aarch64')
url="https://github.com/yetidevworks/ygrep"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/yetidevworks/ygrep/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ygrep-${pkgver}-linux-x86_64-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ygrep-${pkgver}-linux-aarch64-musl.tar.gz")
sha256sums=('16ee06b4e61fdc0d83101ee85e1d859b6bdaaa27567b9fd48904f8b1e5d04cad')
sha256sums_x86_64=('351fc4c554a930143c43f74ab390db7915a1ab5df04c4893c4363cc4d8eaff64')
sha256sums_aarch64=('d06092544ba7de83c607ab68b7f80cd4a52b2618e6cc42d7ef26502a62a72b9c')

package() {
  install -Dm755 "ygrep" "${pkgdir}/usr/bin/ygrep"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
