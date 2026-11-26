# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=maaslin3
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='"Refining and extending generalized multivariate linear models for meta-omic association discovery"'
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocgenerics
  r-collapse
  r-data.table
  r-ggnewscale
  r-ggplot2
  r-lme4
  r-lmertest
  r-mirai
  r-multcomp
  r-optparse
  r-patchwork
  r-rcolorbrewer
  r-reformulas
  r-rlang
  r-scales
)
optdepends=(
  r-dplyr
  r-kableextra
  r-knitr
  r-markdown
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
  r-treesummarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1749512ad76f2b1057f83830ca88f0b8')
b2sums=('40a590bc8abd89462302116f428d14383202fd27fae4ab07f99205daa38724c0ea5bfd915d2dabf2d7a4825417be47e9a7610fc0aef8c0dc7c4b090e0b10c446')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
