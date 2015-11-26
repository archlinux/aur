# Maintainer: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=babeltrace
pkgver=1.3.1
pkgrel=1
pkgdesc="command-line trace reader for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('MIT' 'GPL2' 'LGPL2.1')
depends=('popt' 'util-linux' 'glib2>=2.22.0')
options=('!libtool')
source=(http://www.efficios.com/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
install='babeltrace.install'
sha1sums=('6490f9033f6876f83d78d72b76b863200b0bfb4b')

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
