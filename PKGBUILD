# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtkmm
pkgver=2.14.3
pkgrel=1
pkgdesc="Gtk-- (gtkmm) is a C++ interface for the popular GUI library gtk+"
arch=(i686 x86_64)
depends=('gtk2>=2.14.6' 'pangomm>=2.14.1')
license=('LGPL')
options=('!libtool' '!emptydirs')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.14/${pkgname}-${pkgver}.tar.bz2)
md5sums=('10039f35d7f815d47f926a13cefe65d6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
