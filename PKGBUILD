# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Sc.sgd.db
_pkgver=3.22.0
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
md5sums=('d80576fc746c2aa9dfe5a3158ae29ef6')
b2sums=('d99f231dc43ec12278d90cd55d14be2f4faf9205ef028dd697d4e2856cfc8e84ea6970130c596d9f8ae702f05ab0eb6f284b59fe08c935e076f47ee14126ed87')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
