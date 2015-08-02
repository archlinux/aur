# Maintainer: Benoit Favre <benoit.favre@gmail.com>

pkgname=opengrm-ngram
pkgver=1.2.1
pkgrel=1
pkgdesc="OpenGrm tool for making n-gram language models as weighted finite-state transducers"
arch=('i686' 'x86_64')
url="http://www.opengrm.org/"
license=('APACHE')
depends=('openfst')
source=("http://openfst.cs.nyu.edu/twiki/pub/GRM/NGramDownload/${pkgname}-${pkgver}.tar.gz")
md5sums=('8405ad428c5dd26e8b6fd805500bd00c')


build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr LDFLAGS=-L/usr/lib/fst
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
