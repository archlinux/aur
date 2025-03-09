# Maintainer: Dringsim <dringsim@qq.com>

_cranname=mathml
_cranver=1.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Translate R Expressions to MathML and LaTeX/MathJax"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('BSD')
depends=('r-knitr' 'r-rolog')
makedepends=()
optdepends=('r-rmarkdown'
	'r-testthat')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('0471EE461CFD956859A63A4D15D2461B664F55B48FA5168449F1D7C4C1CFB986')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
sha256sums=('5bf1a76b39602e4d411fb95bc4586fecf0f4969be34188f5109d791142fe94fe')
