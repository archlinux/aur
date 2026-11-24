# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=violet-tui-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="TUI frontend for Vagrant"
arch=('x86_64')
url="https://github.com/braheezy/violet"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'violet')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/violet_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('858a7639cb2cec447d1e6f7f3125fa8c7472b0ae843422396b8b65ada6402f9c')

package() {
  install -Dm755 "violet" "${pkgdir}/usr/bin/violet"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
