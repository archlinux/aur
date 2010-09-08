# $Id $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=libical
pkgver=0.46
pkgrel=1
pkgdesc="An open source reference implementation of the icalendar data type and serialization format"
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/freeassociation/'
license=('LGPL' 'MPL')
depends=('glibc')
options=('!libtool')
source=("http://downloads.sourceforge.net/freeassociation/${pkgname}-${pkgver}.tar.gz")
md5sums=('9c08f88945bfd5d0791d102e4aa4125c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./autogen.sh
  libtoolize --force
  ./configure --prefix=/usr \
    --enable-shared \
    --disable-static
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
