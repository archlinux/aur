# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=xaringan
_cranver=0.28
_archivedate=2022-12-14
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Presentation Ninja"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT custom)
depends=('r>=3.5.0' r-htmltools 'r-knitr>=1.30' 'r-servr>=0.13' 'r-xfun>=0.18' 'r-rmarkdown>=2.8')
optdepends=(r-rstudioapi r-testit)
source=("https://cran.microsoft.com/snapshot/${_archivedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(ea8f96ca69bf5b80c1f6cb51d4375f4395f32271cd56de4ac69f2b32e95d61b3)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
