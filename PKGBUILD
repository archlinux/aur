# $Id: PKGBUILD,v 1.41 2008/04/01 18:45:03 jgc Exp $
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtkmm
pkgver=2.12.6
pkgrel=1
pkgdesc="Gtk-- (gtkmm) is a C++ interface for the popular GUI library gtk+"
arch=(i686 x86_64)
depends=('gtk2>=2.12.9' 'glibmm>=2.16.1' 'cairomm>=1.4.8')
license=('LGPL')
options=('!libtool' '!emptydirs')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.12/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c69d9b2470324e5329eb60fe82f8041e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  # Remove devhelp documentation file and example demonstration binary
  rm -rf ${startdir}/pkg/usr/share/devhelp
  rm -f ${startdir}/pkg/usr/bin/demo
}
