# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=assertthat
_cranver=0.2.1
pkgname=r-assertthat
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Easy Pre and Post Assertions"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r')
optdepends=('r-testthat' 'r-covr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('9f2eae3d20a9d6b40856a6fed013cb05')

build(){
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l $srcdir
}

package() {
  cd "${srcdir}"

  install -dm0755 "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "$_cranname" "$pkgdir/usr/lib/R/library"
}
