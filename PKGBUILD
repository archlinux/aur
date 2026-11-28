# Maintainer: Jingbei Li <i@jingbei.li>
_cranname=qs2
_pkgver=0.5.0
pkgname=r-qs2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Efficient Serialization of R Objects"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPLv3)
depends=(r r-charport r-rcpp r-rcppparallel)
makedepends=(gcc-fortran)
optdepends=(r-data.table r-dplyr r-knitr r-rmarkdown r-stringi)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_pkgver}.tar.gz")

build() {
  R CMD INSTALL ${_cranname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
sha256sums=('c67a7b872d25a84a9149f4f5cea39ef494479ab68fed98d0ce69c6a9674abbf6')
