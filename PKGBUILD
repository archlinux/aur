# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libepc
pkgver=0.3.6
pkgrel=1
pkgdesc="Easy Publish and Consume Library"
arch=(i686 x86_64)
license=('LGPL')
url="http://live.gnome.org/libepc"
depends=('gtk2>=2.14.4' 'avahi>=0.6.20' 'libsoup>=2.24.0' 'gnutls>=2.4.1')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.3/${pkgname}-${pkgver}.tar.bz2)
md5sums=('35cc0451466a3dd655531dc926d98a3f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
