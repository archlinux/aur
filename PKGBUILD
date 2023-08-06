# Maintainer: Robert Tari <robert at tari dot in>

pkgname="librda"
pkgver="0.0.5"
pkgrel="1"
pkgdesc="Remote Desktop Awareness Shared Library"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/ArcticaProject/librda"
license=("LGPL2.1" "GPL3")
makedepends=("automake" "libtool" "gobject-introspection" "intltool")
depends=("glib2" "glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ArcticaProject/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=("97f8f9f42bb798805e682003e696d744")

prepare()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    autoreconf -i
}

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --disable-static --enable-x2go --enable-ogon
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}


