# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=0.48
pkgrel=1
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/freeassociation/'
license=('LGPL' 'MPL')
depends=('glibc')
options=('!libtool')
source=("http://downloads.sourceforge.net/freeassociation/${pkgname}-${pkgver}.tar.gz")
md5sums=('e549f434d5fbf9cd156c60ed4943618f')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./configure --prefix=/usr \
    --enable-shared \
    --disable-static
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
