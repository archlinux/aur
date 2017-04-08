# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: lily wilson <hotaru@thinkindifferent.net>

pkgname=libemf
pkgver=1.0.8
pkgrel=1
pkgdesc="Library implementation of ECMA-234 API for the generation of enhanced metafiles."
arch=('i686' 'x86_64')
url="http://libemf.sourceforge.net/"
license=('LGPL2.1')
provides=('libEMF.so')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ee0324f705136a4d3343c2f0c3e5fa526fae0ec3680a96400d5fd209c60a3891')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --enable-static=no \
        --enable-shared=yes \
        --enable-fast-install \
        --enable-threads \
        --enable-editing
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
