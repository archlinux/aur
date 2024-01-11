# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=ftsa
_cranver=6.3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Functional Time Series Analysis"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL3)
depends=('r>=3.5.0' r-forecast r-rainbow r-sde r-colorspace r-mass r-pcapp r-fda r-pdfcluster r-ecp r-strucchange r-e1071 r-psych r-fgarch r-kernsmooth r-vars r-boot r-fdapace r-laplacesdemon r-evgam r-roopsd r-glue)
optdepends=()
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(2cda35b98fc9058ed517f9ada8e9608f88f4ff9c6697a2bd885624d398408b01)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
