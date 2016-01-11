# Maintainer: Adel Qalieh <aqalieh95 at gmail dot come>

pkgname=log4shib
pkgver=1.0.9
pkgrel=1
pkgdesc='A forked version of log4cpp that has been created for the Shibboleth project'
arch=('i686' 'x86_64')
url="http://shibboleth.net/"
license=('LGPL2')

depends=('gcc-libs')
source=("http://shibboleth.net/downloads/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b34cc90f50962cc245a238b472f72852732d32a9caf9a10e0244d0e70a311d6d')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    pwd
    ./configure --disable-static --disable-doxygen
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
