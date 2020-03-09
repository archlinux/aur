# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>

_cranname=hunspell
_cranver=3.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="High-Performance Stemmer, Tokenizer, and Spell Checker"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 LGPL2.1 MPL1.1)
depends=('r>=3.0.2' 'r-rcpp>=0.12.12' r-digest)
makedepends=(gcc)
optdepends=(r-spelling r-testthat r-pdftools r-janeaustenr r-wordcloud2 r-knitr r-stopwords r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('de549396ea2812d351667fe0272bd098')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
