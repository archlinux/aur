# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=splay-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Fan out AI agents across tasks"
arch=('x86_64')
url="https://github.com/splay-sh/splay"
license=('MIT')
depends=('cairo' 'glib2' 'glibc' 'gtk4' 'libgcc' 'pango')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/splay-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('9f4ae210695a25f350e73feec0c8b94194d7cb7576a8c67cdc20ed3064867a71')

package() {
  install -Dm755 "splay-x86_64-unknown-linux-gnu/splay" "${pkgdir}/usr/bin/splay"
  install -Dm755 "splay-x86_64-unknown-linux-gnu/splayctl" "${pkgdir}/usr/bin/splayctl"
  install -Dm644 "splay-x86_64-unknown-linux-gnu/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "splay-x86_64-unknown-linux-gnu/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
