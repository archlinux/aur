# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtk-engines
pkgver=2.14.1
pkgrel=1
pkgdesc="Theme engines for GTK+ 2"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gtk2>=2.12.9-2')
makedepends=('pkgconfig' 'perlxml')
options=('!libtool')
url="http://live.gnome.org/GnomeArt"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.14/${pkgname}-${pkgver}.tar.bz2)
conflicts=('lighthouse-gtk2' 'clearlooks-gtk2')
replaces=('lighthouse-gtk2')
md5sums=('eef8ee067bad0b76b9773aef1994930c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-animation || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
