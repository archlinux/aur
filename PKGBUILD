# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Hs.eg.db
_pkgver=3.24.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('0454b5641aa9191fa25d39cc330744a0')
b2sums=('95fc987a718a7352b5809c72bd7c4a416144b1fbd7e97bb37b21f19122b30bad1621ab605c352906a326f8aedc603f2ebff6c00c5b0578b0881e3b3bdcb4a8d2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
