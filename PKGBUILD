# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hyperlink-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Very fast link checker for CI"
arch=('x86_64')
url="https://github.com/untitaker/hyperlink"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/hyperlink-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('6288d997456128908905074663b8494617798547a511185a2a9cd8b7d3e32af1')

package() {
  install -Dm755 "hyperlink-x86_64-unknown-linux-gnu/hyperlink" "${pkgdir}/usr/bin/hyperlink"
  install -Dm644 "hyperlink-x86_64-unknown-linux-gnu/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "hyperlink-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
