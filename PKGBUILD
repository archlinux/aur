# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=a4Reporting
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Automated Affymetrix Array Analysis Reporting Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-xtable
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8de5ca2c2ae8a94f872661b217b23835')
b2sums=('38a33f793e50a0c7e29d73fdb7d6d6a9063efd07ad3b82bfef260c2eaa6a1a70a18fc6bb529f5afc23be910a6471e10b43361738417798d1458d0b499595108c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
