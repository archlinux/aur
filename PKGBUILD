# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pwrEWAS
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A user-friendly tool for comprehensive power estimation for epigenome wide association studies (EWAS)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-abind
  r-biocmanager
  r-cpgassoc
  r-doparallel
  r-dosnow
  r-foreach
  r-genefilter
  r-ggplot2
  r-limma
  r-pwrewas.data
  r-shiny
  r-shinybs
  r-shinywidgets
  r-truncnorm
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('72989b16264534ad1fa6fdadda1ff618')
b2sums=('b6f186cf7b2c178a58006565bad4e4bc84717c2bc476980492e39bd1ac195d4e5b6f6b26813f4f2f8395936d7df1a76996c8a99c07483266d273ae7377e12960')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
