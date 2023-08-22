# Maintainer: Dringsim <dringsim@qq.com>

_cranname=DiagrammeRsvg
_cranver=0.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Export DiagrammeR Graphviz Graphs as SVG"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r-v8')
makedepends=()
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('B398F8DAA765319CCB96524BEF5F309ACFF1C537696576C7142BFFD16BA84C48')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 ${_cranname}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}