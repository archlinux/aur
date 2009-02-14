# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libepc
pkgver=0.3.9
pkgrel=1
pkgdesc="Easy Publish and Consume Library"
arch=(i686 x86_64)
license=('LGPL')
url="http://live.gnome.org/libepc"
depends=('gtk2>=2.14.7' 'avahi>=0.6.24' 'libsoup>=2.24.3' 'gnutls>=2.6.4')
makedepends=('intltool')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.3/${pkgname}-${pkgver}.tar.bz2)
md5sums=('42aa1fcbfc0a020b9731aadd79961ccb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
