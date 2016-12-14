# Maintainer: James W. Barnett <jbarnet4@tulane.edu>
pkgname=xdrfile
pkgver=2.1.1
pkgrel=1
pkgdesc='Reads/writes compressed trajectory files.'
license=("GPL")
arch=('i686' 'x86_64')
source=(https://github.com/wesbarnett/lib${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('0a55002120555252a6d8a1600f3bebe30c878eea61837bf9b2118597c8ea6f51')

build() {
    cd ${srcdir}/lib${pkgname}-${pkgver}
    make
}

check() {
    cd ${srcdir}/lib${pkgname}-${pkgver}
    make test
}

package() {
    cd ${srcdir}/lib${pkgname}-${pkgver}
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
