# Maintainer: Philippe Proulx <pproulx@efficios.com>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=babeltrace
pkgver=1.5.0
pkgrel=1
pkgdesc="Command-line trace converter"
arch=('i686' 'x86_64')
url="http://diamon.org/babeltrace"
license=('MIT' 'GPL2' 'LGPL2.1')
depends=('popt' 'util-linux' 'glib2>=2.22.0' 'elfutils>=0.154')
source=(http://www.efficios.com/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('13f106951c418632a2155ebe3cea51fa4929e748')

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --enable-debug-info
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make install DESTDIR=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
