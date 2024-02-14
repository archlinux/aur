# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=crisprseekplus
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="crisprseekplus"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationdbi
  r-biocmanager
  r-bsgenome
  r-crisprseek
  r-dt
  r-genomicfeatures
  r-genomicranges
  r-guideseq
  r-hash
  r-shiny
  r-shinyjs
)
optdepends=(
  r-knitr
  r-r.rsp
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2a26cd0c67eb1679895c3cbc4573e502')
b2sums=('d408573f89e95cb9ace597c4ad187f40767dfcaeeb9d51a9c3da72a420c3d92d36710be4bffda296470db6670609aefd348a38886bf0e70f94cd288b8486f4e9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
