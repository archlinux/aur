# Maintainer: haha662 <haha662 at outlook dot com>

_cranname=servr
_cranver=0.15
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Simple HTTP Server to Serve Static Files or Dynamic Documents"
arch=("any")
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL")
depends=("r" "r-mime>=0.2" "r-httpuv>=1.4.0" "r-xfun" "r-jsonlite")
# makedepends=()
optdepends=("r-later" "r-rstudioapi" "r-knitr" "r-rmarkdown")
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("b13753018d3d06e95a81a908f559119c63a63a304f5e547370394d0e9f4a33a5")

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
