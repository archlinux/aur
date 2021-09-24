# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_cranname=lmodel2
_cranver=1.7-3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Computes model II simple linear regression using ordinary least squares (OLS), major axis (MA), standard major axis (SMA), and ranged major axis (RMA)."
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=('r>=2.14.0')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('cb425276ab20cc1fa98b11e53c931cb622f768e2b547a4c387713937adb031ba')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

