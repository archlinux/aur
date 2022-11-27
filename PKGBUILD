# Maintainer: Haruo <haruo-mtok [at] outlook [dot] com>

_cranname=rnaturalearth
_cranver=0.1.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="World Map Data from Natural Earth"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT + file LICENSE')
depends=(
    'r>=3.1.1'
    'r-sp>=1.0.15'
    'r-sf>=0.3-4'
)
optdepends=(
    'r-rgdal'
    'r-knitr>=1.12.3'
    'r-testthat>=0.9.1'
    'r-httr>=1.1.0'
    'r-devtools>=1.10.0'
    'r-rnaturalearthdata>=0.1.0'
    'r-rnaturalearthhires>=0.1.0'
    'r-raster>=2.5-2'
    'r-rgeos'
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha512sums=('1adf0111ea6c53df39d7b2b33406fce5dfd5de8bfca66b544f8bf78e45090435623657f287b1fa952b1640f0ddbc6f77d5f6ef9f500a59e545eca2362ba78caa')

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
