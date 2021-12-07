# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=sass
_cranver=0.4.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Syntactically Awesome Style Sheets ('Sass')"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r r-fs 'r-rlang>=0.4.10' 'r-htmltools>=0.5.1' r-r6 r-rappdirs)
makedepends=(make)
optdepends=(r-testthat r-knitr r-rmarkdown r-withr r-shiny r-curl)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('7d06ca15239142a49e88bb3be494515abdd8c75f00f3f1b0ee7bccb55019bc2b')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
