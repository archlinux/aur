# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=cNORM
_cranver=3.0.2
_updatedate=2022-06-25
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Continuous Norming"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(AGPL3)
depends=(
	"r>=4.0.0"
	"r-lattice>=0.20"
	"r-leaps>=3.0"
	"r-latticeextra>=0.6"
)
makedepends=()
optdepends=(
	r-knitr
	r-shiny
	r-shinycssloaders
	r-foreign
	r-readxl
	r-rmarkdown
	r-testthat
)
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('31231a0612915ee5171676b28273f82acdc8914bd6385fc9e7b17f930e66c91a')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
