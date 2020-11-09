# Maintainer: Grey Christoforo <first name at last name dot net>

_bcname=BiocManager
_bcver=1.30.10
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="BiocManager: Access the Bioconductor Project Package Repository"
arch=(x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic-2.0)
depends=(r r-knitr r-curl r-withr r-testthat r-remotes)
optdepends=(r-biocstyle r-biocversion)
source=("https://cran.r-project.org/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('f3b7a412b42be0ab8df5fcd9bf981876ba9e5c55bc5faaca7af7ede3b6d0c90e')

build(){
  cd "${srcdir}"

  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"
}

