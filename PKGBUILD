# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=showtext
_cranver=0.9-6
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Using Fonts More Easily in R Graphs"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(Apache)
depends=('r-sysfonts>=0.7.1' 'r-showtextdb>=2.0' r-grdevices)
optdepends=(r-knitr r-rmarkdown r-prettydoc r-curl r-jsonlite)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(0eca59cb519bc4b9e64f7d1d79d5e78a78f84f8ad19de55dbf476832b1d68c30)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
