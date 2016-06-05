# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=cpputest
pkgver=3.8
pkgrel=1
pkgdesc="unit testing and mocking framework for C/C++"
url="http://cpputest.org"
arch=('i686' 'x86_64')
license=('BSD')
provides=('cpputest')
options=('staticlibs' '!strip')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('e8fdbbb5dd37d32d65919f240f984905')

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
