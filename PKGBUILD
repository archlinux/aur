# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=xaringanthemer
_cranver=0.4.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Custom 'xaringan' CSS Themes"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT custom)
depends=('r>=2.10' r-colorspace r-glue r-methods r-purrr r-utils r-whisker)
optdepends=(r-callr r-ggplot2 r-knitr r-mockery r-rmarkdown r-scales r-showtext r-sysfonts 'r-testthat>=2.1.0' r-xaringan)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(5fec74b2caed9037d0228cb008f4058612293172b7cacc0e538798606ac2941c)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
