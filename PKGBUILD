# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=termi-tui-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A modal terminal code editor"
arch=('x86_64')
url="https://github.com/tuna4ll/termi"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/termi-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('611fd8314ada9192493e7f3fbe4a37375fcb95f69296400b6b38ffc4815a0ed5')

package() {
  cd "termi-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 "termi" "${pkgdir}/usr/bin/termi"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
