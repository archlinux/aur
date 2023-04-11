# Maintainer: Nichlas Severinsen <ns@nsz.no>

pkgname=d2-bin
_gitname=d2
pkgver=0.4.0
pkgrel=1
pkgdesc='A modern diagram scripting language that turns text to diagrams'
arch=('x86_64')
url='https://d2lang.com'
license=('MPL2')
depends=('gcc-libs')
options=('!lto')
source=("https://github.com/terrastruct/${_gitname}/releases/download/v${pkgver}/${_gitname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=(
  "c0f00d30d4cdfd0844102d55b45a06b652fa4a2f65dc72425338982a44e196e2"
)
conflicts=('d2')

package() {
  cd "${_gitname}-v${pkgver}"

  install -vDm755 -t "$pkgdir/usr/bin" bin/d2

  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/d2.1

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt

}
