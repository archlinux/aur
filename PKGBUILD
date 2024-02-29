# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=rootSolve
_pkgver=1.8.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Nonlinear Root Finding, Equilibrium and Steady-State Analysis of Ordinary Differential Equations"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('55edadf34bf9065e60c7570e82bc4b16')
b2sums=('bc47ed8a8d26c26ed7394a5d02d5209e79924e870d854c796aa9baa66b178c6ed0bf19d9636ebbd1aa5563ba3b1ec53c5ab5eede1d225461829a838d62299ac1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
