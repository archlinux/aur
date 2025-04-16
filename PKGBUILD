# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EGSEAdata
_pkgver=1.35.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene set collections for the EGSEA package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('CC-BY-ND-4.0')
depends=(
  r
)
optdepends=(
  r-egsea
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cfd8ac3c07b9faa06f3a212a912459da')
b2sums=('bdca3f90cb684d089cb1aa513b3f47c2e84441165874182285c41ffd7a613e7c14321c61a5907e9d9f72774c6331a709707bb6a9fab4b1faf69ffed9ab97690b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
