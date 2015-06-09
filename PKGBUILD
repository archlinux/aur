# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=cpputest
pkgver=3.7.2
pkgrel=1
pkgdesc="unit testing and mocking framework for C/C++"
url="http://cpputest.org"
arch=('i686' 'x86_64')
license=('BSD')
provides=('cpputest')
options=('staticlibs' '!strip')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('f4f7d62cb78e360ee3c979ee834f88b4')

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
