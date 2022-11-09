# Maintainer: Haruo <haruo-mtok [at] outlook [dot] com>

_cranname=riverplot
_cranver=0.10
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Sankey or Ribbon Plots"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(r r-rcolorbrewer)
optdepends=(r-knitr r-maptools r-qpdf r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('723df628cdb527d5e96d5c610082f84aa9a606c56143390e1da0bba3740b5711')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
