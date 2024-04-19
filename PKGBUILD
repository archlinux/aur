# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=xaringan
_cranver=0.30
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Presentation Ninja"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT custom)
depends=('r>=3.5.0' r-htmltools 'r-knitr>=1.30' 'r-servr>=0.13' 'r-xfun>=0.18' 'r-rmarkdown>=2.8')
optdepends=(r-rstudioapi r-testit)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(b1b07ae460336d0fa6ce5a428e5c7a583de55e2d00699b478d8507d57917e53f)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
