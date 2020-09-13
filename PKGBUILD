# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=cpputest
pkgver=4.0
pkgrel=1
pkgdesc="unit testing and mocking framework for C/C++"
url="http://cpputest.org"
arch=('i686' 'x86_64')
license=('BSD')
provides=('cpputest')
options=('staticlibs' '!strip')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('21c692105db15299b5529af81a11a7ad80397f92c122bd7bf1e4a4b0e85654f7')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    ./configure --prefix=/usr
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    make DESTDIR=${pkgdir} install

    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
