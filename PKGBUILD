# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgname=myrowing
pkgname=${_pkgname}-git
_pkgorg=gitlab.com/${_pkgname} 
pkgver=v0.1.0
pkgrel=1
pkgdesc="Analyze your rowing training data"          
arch=(any) 
url="https://${_pkgorg}/${_pkgname}"
license=(GPL3) 
source=("git+https://${_pkgorg}/${_pkgname}.git")
md5sums=(SKIP) 
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
makedepends=(
  git
  pwgen
) 
provides=(myrowing)
 
build() {
  cd "${_pkgname}"
  make
} 
 
package() { 
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install 
} 
