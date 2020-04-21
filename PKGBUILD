# Maintainer: Robert Tari <robert at tari dot in>

pkgname="python-caja"
pkgver="1.24.0"
pkgrel="2"
pkgdesc="Python binding for Caja components"
arch=("x86_64")
url="http://mate-desktop.org"
license=("GPL")
makedepends=("mate-common")
depends=("caja" "python")
source=("http://pub.mate-desktop.org/releases/${pkgver%.*}/python-caja-${pkgver}.tar.xz")
md5sums=("f2cee205c0914014dd35e0627c50911c")
options=("!emptydirs")

prepare()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

