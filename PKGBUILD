# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtk-engines
pkgver=2.20.0
pkgrel=1
pkgdesc="Theme engines for GTK+ 2"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gtk2>=2.20.0')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
url="http://live.gnome.org/GnomeArt"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.20/${pkgname}-${pkgver}.tar.bz2)
conflicts=('lighthouse-gtk2' 'clearlooks-gtk2')
replaces=('lighthouse-gtk2')
sha256sums=('69b2e6798cfdcf7366b025b8f59fc63f658474f823d185473e94f969bae8cad1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-animation || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
