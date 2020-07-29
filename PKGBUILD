# Maintainer: haha662 <haha662 at outlook dot com>

_cranname=servr
_cranver=0.18
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Simple HTTP Server to Serve Static Files or Dynamic Documents"
arch=("any")
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL")
depends=("r>=3.0.0" "r-mime>=0.2" "r-httpuv>=1.5.2" "r-xfun" "r-jsonlite")
# makedepends=()
optdepends=("r-later" "r-rstudioapi" "r-knitr>=1.9" "r-rmarkdown")
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("4ade7860ecbe854d9f9dcf9e71837b670be17026b96549ba5e900c1e5470cb75")

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
