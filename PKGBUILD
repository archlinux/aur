# Maintainer: portaloffreedom

_pkgname=pbdZMQ
_pkgnamelower=pbdzmq
_pkgver=0.3-9
_pkg_tar="${_pkgname}_${_pkgver}.tar.gz"
pkgname=r-$_pkgnamelower
pkgver=0.3.9
pkgrel=1
pkgdesc="Programming with Big Data – Interface to 'ZeroMQ'"
arch=(any)
url="http://group.r-pbd.org/"
source=("https://cran.r-project.org/src/contrib/${_pkg_tar}")
noextract=( ${_pkg_tar} )
sha256sums=('d033238d0a9810581f6b40c7c75263cfc495a585653bbff98e957c37954e0fb6')
license=('GPL3')
depends=('r' 'zeromq')

build() {
    Rscript -e "install.packages(\"$srcdir/${_pkg_tar}\", lib=\"$srcdir\", repos=NULL, type=\"source\")"
}

package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_pkgname" "$pkgdir/usr/lib/R/library"
}
