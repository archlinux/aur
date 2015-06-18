# Maintainer: enzzzzy <enzzzzy ta gmail dot com>
pkgname=dhcping
pkgver=1.2
pkgrel=1
pkgdesc='A small tool to let you perform a dhcp-request to find out if a dhcp-server is still running.'
arch=('i686' 'x86_64')
url='http://www.mavetju.org/unix/general.php'
license=('BSD')
source=(http://www.mavetju.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('c4b22bbf3446c8567e371c40aa552d5d')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr  --build=${CHOST} --host=${CHOST} --mandir=/usr/share/man
    make
}

check() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make check
}

package () {
    echo $pkgdir
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
    chmod 4755 ${pkgdir}/usr/bin/dhcping
}
