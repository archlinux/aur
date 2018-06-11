# Maintainer: portaloffreedom

_pkgname=pbdZMQ
_pkgnamelower=pbdzmq
_pkgver=0.3-3
_pkg_tar="${_pkgname}_${_pkgver}.tar.gz"
pkgname=r-$_pkgnamelower
pkgver=0.3.3
pkgrel=1
pkgdesc="Programming with Big Data – Interface to 'ZeroMQ'"
arch=(any)
url="http://group.r-pbd.org/"
source=("https://cran.r-project.org/src/contrib/${_pkg_tar}")
noextract=( ${_pkg_tar} )
sha256sums=('ae26c13400e2acfb6463ff9b67156847a22ec79f3b53baf65119efaba1636eca')
license=('GPL3')
depends=('r' 'zeromq')

build() {
    Rscript -e "install.packages(\"$srcdir/${_pkg_tar}\", lib=\"$srcdir\", repos=NULL, type=\"source\")"
}

package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_pkgname" "$pkgdir/usr/lib/R/library"
}
