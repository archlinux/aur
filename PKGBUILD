# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=red-editor-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Vim-like modal text editor"
arch=('x86_64')
url="https://github.com/codersauce/red"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'red')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/red-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0732742fc90d796e5a28ccc507ca2f437530e58308da10587175415df5999097')

package() {
  install -Dm755 "./red" "${pkgdir}/usr/bin/red-editor"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
