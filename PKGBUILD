# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=2.0.0
pkgrel=1
pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url='https://github.com/TomWright/dasel'
license=('MIT')
makedepends=('git')
source=(
  "https://github.com/TomWright/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.gz"
  "https://github.com/TomWright/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('902cf24851075ce003b8d8e987fa87f98ebdbe658412f0c380d9ba7ad2372761'
            '64000f987149f20879ea8850b16015bd2cbfaf15e7e570dd0c2015a3683455ab')

package() {
  cd "$srcdir"
  install -Dm755 dasel_linux_amd64 "${pkgdir}/usr/bin/dasel"
  install -Dm644 ${_pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
