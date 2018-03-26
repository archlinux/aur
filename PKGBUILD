# Maintainer: portaloffreedom

_pkgname=pbdZMQ
_pkgnamelower=pbdzmq
_pkgver=0.3-2
_pkg_tar="${_pkgname}_${_pkgver}.tar.gz"
pkgname=r-$_pkgnamelower
pkgver=0.3.2
pkgrel=1
pkgdesc="Programming with Big Data – Interface to 'ZeroMQ'"
arch=(any)
url="http://group.r-pbd.org/"
source=("https://cran.r-project.org/src/contrib/${_pkg_tar}")
noextract=( ${_pkg_tar} )
sha256sums=('ece2a2881c662f77126e4801ba4e01c991331842b0d636ce5a2b591b9de3fc37')
license=('GPL3')
depends=('r' 'zeromq')

build() {
    Rscript -e "install.packages(\"$srcdir/${_pkg_tar}\", lib=\"$srcdir\", repos=NULL, type=\"source\")"
}

package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_pkgname" "$pkgdir/usr/lib/R/library"
}
