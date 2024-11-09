# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Hs.eg.db
_pkgver=3.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Genome wide annotation for Human"
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
md5sums=('191276f1fde82d731babe624c7a9063f')
b2sums=('d44db5395590d24af3767c3ca5de80a78047c8a3ab8b263bafa913751a6290c7dce9a99a5d35cd2c84ca423bb606db1c27b08e7527eee0feef531122e1a20fbb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
