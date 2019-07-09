# Maintainer: Robert Tari <robert at tari dot in>

pkgname="python-caja"
pkgver="1.22.0"
pkgrel="1"
pkgdesc="Python binding for Caja components"
arch=("x86_64")
url="http://mate-desktop.org"
license=("GPL")
depends=("caja" "python")
source=("http://pub.mate-desktop.org/releases/${pkgver%.*}/python-caja-${pkgver}.tar.xz")
md5sums=('7978c262379926c45dfba8a60b5f414b')
options=("!emptydirs")

prepare()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    #PYTHON=/usr/bin/python2 ./configure --prefix=/usr
    ./configure --prefix=/usr
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

