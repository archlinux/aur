# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Rn.eg.db
_pkgver=3.24.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Rat"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5dc1e94df179801fa6c5d1251bc67f1a')
b2sums=('ab3632685962df5279399b5e240e468f7825e9491169df6b8c27366fbe6f95a5e088104220bb3ee5d0137d8d6c9d72ac658de13b8ed733dd77f9e42c902ab42f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
