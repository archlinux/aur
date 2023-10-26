# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mCSEAdata
_pkgver=1.21.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data package for mCSEA package"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
depends=(
  r-genomicranges
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('07213f360048ef9593e393696225be05')
sha256sums=('b4a9086a4559cde0222b15e05922c8069e34a77cd498a524c8e4cca6ac38a278')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
