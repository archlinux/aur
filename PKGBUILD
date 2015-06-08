# Contributor: jordz <jordz@archlinux.us>
# Contributor: kevku <kevku@gmx.com>
# Maintainer: Alexander 'chron' Kempen <chronischzuspaet at gmail dot com>
pkgname=par2cmdline-tbb
_pkgname=par2cmdline
pkgver=20150503
_pkgver=0.4
pkgrel=1
pkgdesc="This is a concurrent (multithreaded) version of par2cmdline 0.4"
arch=('i686' 'x86_64')
url="http://www.chuchusoft.com/par2_tbb/"
license=('GPL')
depends=('intel-tbb')
conflicts=('par2cmdline')
provides=('par2cmdline=0.4')
source=("http://www.chuchusoft.com/par2_tbb/par2cmdline-0.4-tbb-$pkgver.tar.gz")

sha256sums=('1840ab6ebbd8ac980f496dcb2d0446eaae418237dc5471cfd04a35dece1b3c51')

build() {
    cd ${srcdir}/${_pkgname}-${_pkgver}
    ./configure --prefix=/usr
    make
}

check() {
    cd ${srcdir}/${_pkgname}-${_pkgver}
    make check
}

package(){
    cd ${srcdir}/${_pkgname}-${_pkgver}
    make DESTDIR=${pkgdir} install
}
