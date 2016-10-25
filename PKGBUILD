# Maintainer: James W. Barnett <jbarnet4@tulane.edu>
pkgname=xdrfile
pkgver=2.1
pkgrel=1
pkgdesc='Reads/writes compressed trajectory files.'
license=("GPL")
arch=('i686' 'x86_64')
source=(https://github.com/wesbarnett/lib${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('5bdbaddf3128bd97c5b01db29c1984bb')

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
    make DESTDIR=${pkgdir} install
}
