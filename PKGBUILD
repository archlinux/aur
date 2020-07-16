# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

_cranname=rJava
_cranver=0.9-13
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Low-level interface to Java VM very much like .C/.Call and friends. Allows creation of objects, calling methods and accessing fields"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' 'java-runtime' )
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('5b1688f5044476b34f71d868b222ac5fce3a088f0c2b9e4591c1e48f3d8c75f4')
  
build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}