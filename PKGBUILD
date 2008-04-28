# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtkmm
pkgver=2.12.7
pkgrel=1
pkgdesc="Gtk-- (gtkmm) is a C++ interface for the popular GUI library gtk+"
arch=(i686 x86_64)
depends=('gtk2>=2.12.9-2' 'glibmm>=2.16.2' 'cairomm>=1.6.0')
license=('LGPL')
options=('!libtool' '!emptydirs')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.12/${pkgname}-${pkgver}.tar.bz2)
md5sums=('ad199f4a392799134c128deab48fee30')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  # Remove devhelp documentation file and example demonstration binary
  rm -rf ${startdir}/pkg/usr/share/devhelp
  rm -f ${startdir}/pkg/usr/bin/demo
}
