# Maintainer: Nichlas Severinsen <ns@nsz.no>

pkgname=d2-bin
_gitname=d2
pkgver=0.4.1
pkgrel=1
pkgdesc='A modern diagram scripting language that turns text to diagrams'
arch=('x86_64')
url='https://d2lang.com'
license=('MPL2')
depends=('gcc-libs')
options=('!lto')
source=("https://github.com/terrastruct/${_gitname}/releases/download/v${pkgver}/${_gitname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=(
  "25ac9aa7784394a0681b6fffb7689fc74c8a3a52a3953fa7f2e7a5fc9c0678c1"
)
conflicts=('d2')

package() {
  cd "${_gitname}-v${pkgver}"

  install -vDm755 -t "$pkgdir/usr/bin" bin/d2

  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/d2.1

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt

}
