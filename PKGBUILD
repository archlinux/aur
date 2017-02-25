#$Id: PKGBUILD 255159 2015-12-10 04:46:08Z foutrelis $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=gnome-vfsmm
pkgver=2.26.0
pkgrel=4
pkgdesc="A C++ wrapper for gnome-vfs."
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gnome-vfs' 'glibmm')
makedepends=('pkgconfig' 'doxygen')
url="http://gtkmm.sourceforge.net/"
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.26/${pkgname}-${pkgver}.tar.bz2")
md5sums=('d27d34b6a8722c557366729071c1baab')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CXXFLAGS+=" -std=gnu++11"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
