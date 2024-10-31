# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rRDP
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface to the RDP Classifier"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only AND Apache-2.0 AND LGPL-2.1-only')
depends=(
  java-runtime
  r-biostrings
  r-rjava
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-rrdpdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2dc3e7d6baa2781859dbf38bc08ecbc5')
b2sums=('e3aea8488a4fa12a04147e7e5056f0efd3fc01097c1a81aaddea998f6878aad176a81f3a4a026cde6fe68af5bba4b67692446dcfe028a404df84afcbc2da596b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
