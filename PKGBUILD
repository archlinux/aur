# Maintainer: Nichlas Severinsen <ns@nsz.no>

pkgname=d2-bin
_gitname=d2
pkgver=0.5.1
pkgrel=1
pkgdesc='A modern diagram scripting language that turns text to diagrams'
arch=('x86_64')
url='https://d2lang.com'
license=('MPL2')
depends=('gcc-libs')
options=('!lto')
source=("https://github.com/terrastruct/${_gitname}/releases/download/v${pkgver}/${_gitname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=(
  "51f0fe652f7be499e9afdd1481a627022858ab7384ade0773fefff343872e14e"
)
conflicts=('d2')

package() {
  cd "${_gitname}-v${pkgver}"

  install -vDm755 -t "$pkgdir/usr/bin" bin/d2

  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/d2.1

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt

}
