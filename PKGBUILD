# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Dm.eg.db
_pkgver=3.19.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Fly"
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
md5sums=('1d9c8b18c0ed255e759f83ef28aa6d84')
b2sums=('31d4c6b06db09a9f19284e587a7c29522715453ea72f3c5a61ca0a35917aecf38dddeaf8369d6673963fc9591f0db40ecaa0308728388767d386e8d93b343627')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
