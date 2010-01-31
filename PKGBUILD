# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtk-engines
pkgver=2.18.5
pkgrel=1
pkgdesc="Theme engines for GTK+ 2"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gtk2>=2.18.6')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
url="http://live.gnome.org/GnomeArt"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.18/${pkgname}-${pkgver}.tar.bz2)
conflicts=('lighthouse-gtk2' 'clearlooks-gtk2')
replaces=('lighthouse-gtk2')
sha256sums=('494db7876b8c69b760c097493e4c3566a71231c54a90eaa6ef9529884e2a9f12')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-animation || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
