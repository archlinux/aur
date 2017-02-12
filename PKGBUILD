# Mantainer: Oliver Hattshire <hattshire at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libsexy
pkgver=0.1.11
pkgrel=5
pkgdesc="Doing naughty things to good widgets."
arch=('i686' 'x86_64')
license=('GPL')
url="http://chipx86.com/wiki/Libsexy"
depends=('gtk2' 'libxml2')
makedepends=('iso-codes' 'pkgconfig')
source=("http://releases.chipx86.com/libsexy/libsexy/${pkgname}-${pkgver}.tar.gz")
md5sums=('33c079a253270ec8bfb9508e4bb30754')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -f ${pkgdir}/usr/lib/libsexy.a
}
