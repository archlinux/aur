# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=showtext
_cranver=0.9-5
_archivedate=2022-02-10
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Using Fonts More Easily in R Graphs"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(Apache)
depends=('r-sysfonts>=0.7.1' 'r-showtextdb>=2.0' r-grdevices)
optdepends=(r-knitr r-rmarkdown r-prettydoc r-curl r-jsonlite)
source=("https://cran.microsoft.com/snapshot/${_archivedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(63c19d1d85ffff9198bb493647eacf3d21080b5465d4a6225e56d9643bb659d1)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
