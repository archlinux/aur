# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=FSA
_cranver=0.9.3
_updatedate=2022-06-08
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc=""
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(
	r
	r-car
	r-dunn.test
	r-lmtest
	r-plotrix
	r-withr
)
optdepends=(
	r-desctools
	r-dplyr
	r-fishmethods
	r-fsadata
	r-knitr
	r-marked
	r-nlme
	r-nlstools
	r-pkgdown
	r-plyr
	r-psych
	r-rcapture
	r-rmarkdown
	r-testthat
	r-tibble
	r-covr
)
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('3c102c2bab42ae3ffbf1180eaca4d48814f11fd0af3f684ef2f68593430a5d81')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
