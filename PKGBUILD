# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethTargetedNGS
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Perform Methylation Analysis on Next Generation Sequencing Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  hmmer
  r-biostrings
  r-gplots
  r-pwalign
  r-seqinr
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('765dca656b5f3a7c778d51ea76a0032a')
b2sums=('1a7d63f153327b380b1edabf06b4f3afb7510bc36ac00ad54ddd30dcde5d45d7b90f3e580635b5b0b6b256b8ee69a1e89bec8cb60320b329163bcdf245c60592')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
