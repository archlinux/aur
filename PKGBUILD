# Maintainer: Robert Tari <robert at tari dot in>

pkgname=python-caja
pkgver=1.20.2
pkgrel=1
pkgdesc="Python binding for Caja components"
arch=('i686' 'x86_64')
url="http://mate-desktop.org"
license=('GPL')
depends=('caja' 'python2-gobject' 'python2')
source=("http://pub.mate-desktop.org/releases/${pkgver%.*}/python-caja-${pkgver}.tar.xz")
sha1sums=('096d13d711090ccf53475af4d5fa7ae6b6badfdf')

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    PYTHON=/usr/bin/python2 ./configure --prefix=/usr
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

