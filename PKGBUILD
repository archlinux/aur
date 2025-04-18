# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Sc.sgd.db
_pkgver=3.21.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Yeast"
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
md5sums=('a1e69cde3a5b722e50cc95a7a63ef642')
b2sums=('357d0feae2e55289ac8d17cd7cae255dcfd947f428eb0dafbb4fb71bde5b6e5ce470506804ccefa54d15a4784333cc0578a497127e270dae556fc399e8b6842b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
