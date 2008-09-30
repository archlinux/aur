# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtk-engines
pkgver=2.16.0
pkgrel=1
pkgdesc="Theme engines for GTK+ 2"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gtk2>=2.14.3')
makedepends=('pkgconfig' 'perlxml')
options=('!libtool')
url="http://live.gnome.org/GnomeArt"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.16/${pkgname}-${pkgver}.tar.bz2)
conflicts=('lighthouse-gtk2' 'clearlooks-gtk2')
replaces=('lighthouse-gtk2')
md5sums=('a301ca944d8c839298ec45a01a4a30c8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-animation || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
