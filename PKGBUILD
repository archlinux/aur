# Maintainer: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=babeltrace
pkgver=1.3.2
pkgrel=1
pkgdesc="command-line trace reader for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('MIT' 'GPL2' 'LGPL2.1')
depends=('popt' 'util-linux' 'glib2>=2.22.0')
options=('!libtool')
source=(http://www.efficios.com/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
install='babeltrace.install'
sha1sums=('ba95d2a6e9c55c0c0875c0cf722f14e6d6d73c12')

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make install DESTDIR=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
