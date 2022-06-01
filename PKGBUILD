# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: getzze <getzze@gmail.com>
_cranver=rgeos
_cranver=0.5-9
pkgname=r-rgeos
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='Interface to Geometry Engine - Open Source (GEOS) using the C-API for topology operations on geometries.'
arch=('x86_64')
url='https://cran.r-project.org/package=rgeos'
license=('GPL')
depends=('r' 'r-cli' 'geos')
source=("https://cran.r-project.org/src/contrib/rgeos_"$_cranver".tar.gz")
sha512sums=("f589f76174ceee90f22cf5c6f8684e6ff48652307b762fdb90e47d33fce0dee8a3e74496696ee3271f7776c582745c2ea8cb1c8e1e3c9729b548d0e2b6003e93")

build(){
    R CMD INSTALL rgeos_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership rgeos "$pkgdir"/usr/lib/R/library
}

