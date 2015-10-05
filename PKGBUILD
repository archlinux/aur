# Maintainer: James W. Barnett <jbarnet4@tulane.edu>
pkgname=xdrfile
pkgver=1.1.4
pkgrel=1
pkgdesc='Reads/writes compressed trajectory files.'
license=("LGPL")
arch=('i686' 'x86_64')
source=(ftp://ftp.gromacs.org/contrib/${pkgname}-${pkgver}.tar.gz)
md5sums=('d992901d1bd7305b91d280ab85427c7b')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure
    make
}

check() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make test
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
