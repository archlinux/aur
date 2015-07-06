# Contributor: Tido
# Maintainer: Erik Johnson (palehose at gmail dot com)
pkgname=sqsh
_srcver=2.5
pkgver="${_srcver}.16.1"
pkgrel=1
pkgdesc="Unix/Linux replacement for Sybase's isql"
url="http://www.sqsh.org/"
arch=('x86_64' 'i686')
license="GPL"
depends=('freetds' 'readline' 'libxaw')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${_srcver}/${pkgname}-${pkgver}.tgz)
md5sums=(8ddbc202f1457a98e9ad74eb54cd668b)

build() {
    cd "${srcdir}/${pkgname}-${_srcver}"
    export SYBASE=/usr
    ./configure --prefix=/usr --sysconfdir=/etc --with-x --with-readline
    make
}

package() {
    cd "${srcdir}/${pkgname}-${_srcver}"
    make DESTDIR="$pkgdir" install.man
    make DESTDIR="$pkgdir" install
}
