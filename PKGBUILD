# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=survey
_pkgver=4.4-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of Complex Survey Samples"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-minqa
  r-mitools
  r-numderiv
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-aer
  r-compquadform
  r-dbi
  r-hexbin
  r-quantreg
  r-r.rsp
  r-rsqlite
  r-summer
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('06574ba74a051c98255e363584da7a36')
b2sums=('effa071ca864052ff3c740132cffe74df2f9e58631cde91bc4194b4d68b37690942d746d602201ac1906f7a3e6d0c3ef9126afe77938275d430fd47e1fd9d977')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
