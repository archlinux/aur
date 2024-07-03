# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Alexandre Courbot <gnurou@gmail.com>
# Contributor: Michal Hybner <dta081@gmail.com>
pkgname=libkarma
pkgver=0.1.2
pkgrel=4
pkgdesc="Network access library for the Rio Karma"
arch=(i686 x86_64)
url="http://www.freakysoft.de/libkarma/"
license=('GPL-2.0-or-later')
depends=('glibc' 'libusb-compat' 'taglib' 'zlib')
source=(http://www.freakysoft.de/libkarma/libkarma-${pkgver}.tar.gz)
md5sums=('2fe636b011dca1cd2a78cd189b891ed8')

build() {
cd ${srcdir}/libkarma-${pkgver}/
CFLAGS+=' -Wl,-z,now'
make -j1
}
package() {
cd ${srcdir}/libkarma-${pkgver}/
make -j1 PREFIX=${pkgdir}/usr install
}

