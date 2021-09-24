# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_cranname=splus2R
_cranver=1.3-3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Currently there are many functions in S-PLUS that are missing in R. To facilitate the conversion of S-PLUS packages to R packages, this package provides some missing S-PLUS functionality in R."
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=('r>=2.7.2')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('7d5c90842debaf6046d445e3fce4f9721baad0339aa7193339705ef68568bf0c')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

