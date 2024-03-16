# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=STRINGdb
_pkgver=2.14.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Protein-Protein Interaction Networks and Functional Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-gplots
  r-hash
  r-httr
  r-igraph
  r-plotrix
  r-plyr
  r-png
  r-rcolorbrewer
  r-sqldf
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8ab16811de5615c8819839ff03638c29')
b2sums=('d3337261b023913383f415d27c4ed16ee3b9cfca580e2c86e6004e0d39c25ecdca60a88970a3b7f434cc1a2d94896222120f40eb978e9fba3a3f8b28255fb9a0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
