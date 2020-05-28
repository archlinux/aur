# Maintainer: haha662 <haha662 at outlook dot com>

_cranname=servr
_cranver=0.17
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Simple HTTP Server to Serve Static Files or Dynamic Documents"
arch=("any")
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL")
depends=("r>=3.0.0" "r-mime>=0.2" "r-httpuv>=1.4.0" "r-xfun" "r-jsonlite")
# makedepends=()
optdepends=("r-later" "r-rstudioapi" "r-knitr>=1.9" "r-rmarkdown")
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("47679da6966808d2e6796b0929ec9b5b7062ad48d2987e1b3369365e4f96b353")

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
