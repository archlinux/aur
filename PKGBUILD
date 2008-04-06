# $Id: PKGBUILD,v 1.35 2008/03/16 22:29:51 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtk-engines
pkgver=2.14.0
pkgrel=1
pkgdesc="Theme engines for GTK+ 2"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gtk2>=2.12.8-2')
makedepends=('pkgconfig' 'perlxml')
options=('!libtool')
url="http://live.gnome.org/GnomeArt"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.14/${pkgname}-${pkgver}.tar.bz2)
conflicts=('lighthouse-gtk2' 'clearlooks-gtk2')
replaces=('lighthouse-gtk2')
md5sums=('c4784ceacddbf818c22ce36b13f6c7a1')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-animation || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
