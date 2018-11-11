# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>
_cranname=sfsmisc
_cranver=1.1-2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-sfsmisc
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities from Seminar fuer Statistik ETH Zurich"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r')

optdepends=('r-lokern')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
sha512sums=('15750c21c489a8bc7780c52b6cca432830db9d9a2535720b3e051d3485869f8a585d89bb819d2bb1690df8031c3418e4c0ef288900766505331d35398f977216')
replaces=('r-cran-sfsmisc')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}

package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

