# Maintainer: S.Leduc <sebastien@sleduc.fr>

pkgname=lddot
pkgrel=1
pkgver=0.2
pkgdesc="A wrapper over ldd, which produces output in Graphviz format."
arch=("any")
url="https://github.com/jwilk/lddot"
license=('MIT')
depends=('python')
optdepends=('graphviz: Graph visualization software for lddot output'
            'perl-graph-easy: Convert or render graphs to ASCII/Image')
source=("https://github.com/jwilk/lddot/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bbf7f9d6cf67d447d8b336c7a7ee627f4b79707dac9cb41bf1c0344f1067a740')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install
  install -Dm644 doc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
