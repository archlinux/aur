# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=WDI
_cranver=2.7.8
_updatedate=2022-09-26
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="World Development Indicators and Other World Bank Data"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=(	'r>=3.5.0'
		r-jsonlite )
optdepends=(	r-testthat
		r-curl
		'r-tidyr>=0.8.0')
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(acf56a705d38cadda108a1b9f3a8ce22090bac57c44f1b6ffd23c43d3c39ede0)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
