# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: haha662 <haha662 at outlook dot com>

_cranname=servr
_cranver=0.24
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
sha512sums=("7fdceed86da4c367372fab09ecb20ba7128c009fa09479980de376491be0fd5fcd59169e28166d88740191d461e0a87fb11c32a0172a5607e339be8af4d086e1")

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
