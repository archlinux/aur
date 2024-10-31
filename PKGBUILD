# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yeastCC
_pkgver=1.45.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spellman et al. (1998) and Pramila/Breeden (2006) yeast cell cycle microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d2a8493d096d1b6b8745340d8299de6b')
b2sums=('ad033d9a2b1375d8919e55949067a8b58de7941a3787b827dbad71daa427b60092f29d860d6438f46276a777ef2f6770160c23fa20cc7a258dfc92eede2968d5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
