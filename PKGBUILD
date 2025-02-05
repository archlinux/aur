# Maintainer: S.Leduc <sebastien@sleduc.fr>

pkgname=lddot
pkgrel=1
pkgver=0.2.1
pkgdesc="A wrapper over ldd, which produces output in Graphviz format."
arch=("any")
url="https://github.com/jwilk/lddot"
license=('MIT')
depends=('python')
optdepends=('graphviz: Graph visualization software for lddot output'
            'perl-graph-easy: Convert or render graphs to ASCII/Image')
source=("https://github.com/jwilk/lddot/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e066b1201bf1f78eefa6d33b77efb4363d6a43c69f716096480006228dbd66fd')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install
  install -Dm644 doc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
