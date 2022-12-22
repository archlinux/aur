# Maintainer: Nichlas Severinsen <ns@nsz.no>

pkgname=d2-bin
_gitname=d2
pkgver=0.1.2
pkgrel=1
pkgdesc='A modern diagram scripting language that turns text to diagrams'
arch=('x86_64')
url='https://d2lang.com'
license=('MPL2')
depends=('gcc-libs')
options=('!lto')
source=("https://github.com/terrastruct/${_gitname}/releases/download/v${pkgver}/${_gitname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=(
  "a1601905c2ddc9736051e79cbc47076c5297883a38ce3ac51b41da9c1a4d7cff"
)
conflicts=('d2')

package() {
  cd "${_gitname}-v${pkgver}"

  install -vDm755 -t "$pkgdir/usr/bin" bin/d2

  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/d2.1

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt

}
