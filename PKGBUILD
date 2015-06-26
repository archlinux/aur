# Maintainer: Benoit Favre <benoit.favre@gmail.com>

pkgname=thrax
pkgver=1.1.0
pkgrel=1
pkgdesc="tool from OpenGrm to compile grammars into weighted finite-state transducers"
arch=('i686' 'x86_64')
url="http://www.opengrm.org/"
license=('APACHE')
depends=('openfst')
source=("http://openfst.cs.nyu.edu/twiki/pub/GRM/ThraxDownload/${pkgname}-${pkgver}.tar.gz")
md5sums=('1d81d9999e7d95b30b6ba8a1f20853c0')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    ./configure LDFLAGS=-L/usr/lib/fst
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
