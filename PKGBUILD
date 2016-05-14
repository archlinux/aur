# Maintainer: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=lttng-tools
pkgver=2.7.2
pkgrel=1
pkgdesc="Trace control client for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('GPL2' 'LGPL2.1')
provides=('lttng')
source=(http://lttng.org/files/$pkgname/$pkgname-$pkgver.tar.bz2)
depends=('popt' 'liburcu>=0.7.2' 'lttng-ust>=2.7.0' 'linux>=2.6.27' 'libxml2>=2.7.6')
optdepends=('lttng-modules: kernel tracing support' 'babeltrace: trace viewing')
options=('!libtool')
sha1sums=('3cc995bca42fc7c6a7ba4b2227a58a7a5128fc58')


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
}
