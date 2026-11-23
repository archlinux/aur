# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=goSorensen
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical inference based on the Sorensen-Dice dissimilarity and the Gene Ontology (GO)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-clusterprofiler
  r-goprofiles
  r-org.hs.eg.db
  r-stringr
)

optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-biocmanager
  r-org.at.tair.db
  r-org.ag.eg.db
  r-org.bt.eg.db
  r-org.ce.eg.db
  r-org.cf.eg.db
  r-org.dm.eg.db
  r-org.dr.eg.db
  r-org.ecsakai.eg.db
  r-org.eck12.eg.db
  r-org.gg.eg.db
  r-org.mm.eg.db
  r-org.mmu.eg.db
  r-org.rn.eg.db
  r-org.sc.sgd.db
  r-org.ss.eg.db
  r-org.pt.eg.db
  r-org.xl.eg.db
  r-dt
  r-ggplot2
  r-ggrepel
  r-go.db
  r-magick
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0db3f01975cc5c46cd233ea5f8beb362')
b2sums=('e65e232417d86f9a029d8dc4736a15bb76d0d1c3dc8adeb6ebf7c1b38c220be752f191c2390518431b8f6067dd6e51b055cfd87f49223a50f0bae971426618a8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
