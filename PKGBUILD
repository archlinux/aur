# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=goSorensen
_pkgver=1.8.0
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aba6bdd63cc6e5ee46dac40d3297caca')
b2sums=('5e7bde9097e22529679cfb9ffb15e2eb8ec6afb3a64a897d0dab195b9112db2dc179a29d2610679c0cf1fda1cfc23e2cc1e736606b674d35e74098b125eb0e7d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
