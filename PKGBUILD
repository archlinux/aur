# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Bt.eg.db
_pkgver=3.21.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Bovine"
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
md5sums=('bba216d22682fef42b88c86a2db4b3f5')
b2sums=('76141219211255bede79509bb71fad62f8deb5a6883573a5aaebe30acdaf0c463269ae3ed2be3962a8b24d5f657eb23744f40769b3b81c420c5cdf549fe40993')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
