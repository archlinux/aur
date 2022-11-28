# Maintainer: portaloffreedom

_pkgname=pbdZMQ
_pkgnamelower=pbdzmq
_pkgver=0.3-8
_pkg_tar="${_pkgname}_${_pkgver}.tar.gz"
pkgname=r-$_pkgnamelower
pkgver=0.3.8
pkgrel=1
pkgdesc="Programming with Big Data – Interface to 'ZeroMQ'"
arch=(any)
url="http://group.r-pbd.org/"
source=("https://cran.r-project.org/src/contrib/${_pkg_tar}")
noextract=( ${_pkg_tar} )
sha256sums=('eded4ccf6ee54a59e06061f1c6e67a8ec36e03c6ab2318af64446d8f95505465')
license=('GPL3')
depends=('r' 'zeromq')

build() {
    Rscript -e "install.packages(\"$srcdir/${_pkg_tar}\", lib=\"$srcdir\", repos=NULL, type=\"source\")"
}

package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_pkgname" "$pkgdir/usr/lib/R/library"
}
