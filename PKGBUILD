# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=extrafont
_cranver=0.17
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Tools for using fonts"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=('r>=2.15' r-extrafontdb r-rttf2pt1)
optdepends=(r-fontcm)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('2f6d7d79a890424b56ddbdced361f8b9ddede5edd33e090b816b88a99315332d')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
