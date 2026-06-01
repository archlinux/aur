# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=opencpu
_pkgver=2.2.15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Producing and Reproducing Results"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-brew
  r-curl
  r-evaluate
  r-httpuv
  r-jsonlite
  r-knitr
  r-mime
  r-openssl
  r-protolite
  r-rappdirs
  r-remotes
  r-rlang
  r-sys
  r-vctrs
  r-webutils
  r-zip
  pandoc
)
optdepends=(
  apparmor
  r-arrow
  r-haven
  r-pander
  r-svglite
  r-unix
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cedb76dab48151a09f4eb3c6ba19488b')
b2sums=('16cbb0502910b1bc7ecaa32a520f3b1cf5d896d1343811cd2bfae8ae382755b1b54fae4f5a8a280e8102a1cc64fac42bdba6bdb77e1ee360fddc12c7876268f9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
