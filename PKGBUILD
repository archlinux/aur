# Maintainer: Robert Tari <robert at tari dot in>

pkgname="python-caja"
pkgver="1.23.0"
pkgrel="1"
pkgdesc="Python binding for Caja components"
arch=("x86_64")
url="http://mate-desktop.org"
license=("GPL")
depends=("caja" "python")
source=("http://pub.mate-desktop.org/releases/${pkgver%.*}/python-caja-${pkgver}.tar.xz")
md5sums=("dd1c23e27330e6409422a2cc6e14b3f9")
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

