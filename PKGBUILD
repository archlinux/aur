# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NuPoP
_pkgver=2.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="An R package for nucleosome positioning prediction"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('65372d828848fa588584e42324762643')
b2sums=('62e72a0067788c712c38bd8a70f19541739a6113871c90b8a953f3e7a44b2248ba2b0ae0f7ef01aad9dfc38581f1ca86fae8de37964fc1daf1fe535eb03e10f6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
