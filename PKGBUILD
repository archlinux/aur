# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iSeq
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian Hierarchical Modeling of ChIP-seq Data Through Hidden Ising Models"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fce059e128fa5013227326899ac4e687')
b2sums=('52425723efcb6dcc91ec7e652effaeb629715a0e7bf49773ae7bc2f6a98445a6933f976e4572790f0a8d258a20c689d83ed99ee6b423a9f630f61db7bb08ee2e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
