# Maintainer: portaloffreedom

_pkgname=pbdZMQ
_pkgnamelower=pbdzmq
_pkgver=0.3-10
_pkg_tar="${_pkgname}_${_pkgver}.tar.gz"
pkgname=r-$_pkgnamelower
pkgver=0.3.10
pkgrel=1
pkgdesc="Programming with Big Data – Interface to 'ZeroMQ'"
arch=(any)
url="http://group.r-pbd.org/"
source=("https://cran.r-project.org/src/contrib/${_pkg_tar}")
noextract=( ${_pkg_tar} )
sha256sums=('39a20058e4027fab6f4a4cf0f557fef4e77409c9656d00252ef31cb6d90ad191')
license=('GPL3')
depends=('r' 'zeromq')

build() {
    Rscript -e "install.packages(\"$srcdir/${_pkg_tar}\", lib=\"$srcdir\", repos=NULL, type=\"source\")"
}

package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_pkgname" "$pkgdir/usr/lib/R/library"
}
