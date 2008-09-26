# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtkmm
pkgver=2.14.1
pkgrel=1
pkgdesc="Gtk-- (gtkmm) is a C++ interface for the popular GUI library gtk+"
arch=(i686 x86_64)
depends=('gtk2>=2.14.3' 'pangomm>=2.14.0')
license=('LGPL')
options=('!libtool' '!emptydirs')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.14/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0209b424987a74c956ea6b70fddaaa37')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  # Remove devhelp documentation file and example demonstration binary
  #rm -rf ${startdir}/pkg/usr/share/devhelp
  #rm -f ${startdir}/pkg/usr/bin/demo
}
