# Maintainer: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=lttng-ust
pkgver=2.7.3
pkgrel=1
pkgdesc="Userspace tracing library for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('LGPL2.1' 'GPL2' 'MIT')
depends=('liburcu>=0.7.2' 'util-linux' 'python')
optdepends=('babeltrace')
options=('!libtool')
source=(http://lttng.org/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
install='lttng-ust.install'
sha1sums=('1e124b787f13c7451d49f3d04df2411f40cd8134')

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
    install -D -m644 COPYING ${pkgdir}/usr/share/licenses/lttng-ust/COPYING
}
