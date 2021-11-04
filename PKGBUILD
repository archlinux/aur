# $Id: PKGBUILD 255462 2015-12-10 04:57:10Z foutrelis $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>
# Contributor: Manuel Schneckenreither <manuel.schnecki@gmail.com>

pkgname=libgnomeuimm
pkgver=2.8.0
pkgrel=4
pkgdesc="A C++ wrapper for libgnomeui"
arch=('i686' 'x86_64')
url="http://gtkmm.sourceforge.net/"
license=('GPL')
depends=('libgnomeui>=2.24.4' 'libgnomecanvasmm>=2.8.0' 'libgnomemm>=2.30.0' 'libglademm>=2.6.7' 'gconfmm>=2.28.2' 'gnome-vfsmm>=2.26.0')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.8/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('96f4a56d78372521040f8faad5f7b25ea5a086419c5e00957ca6167d6436d6e8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
