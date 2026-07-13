# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NLP
_pkgver=0.3-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Natural Language Processing Infrastructure"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3362873eba9034f978b1efbe416395ec')
b2sums=('f12ee0175ed1672f047f440b3445fb81eb4b8f373e14e7d6d27453ea2e86b0930de039dba920d984b2b10865a51866d93e739b022abdf514dd6bccfdc479df69')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
