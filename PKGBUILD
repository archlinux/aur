# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libepc
pkgver=0.4.2
pkgrel=1
pkgdesc="Easy Publish and Consume Library"
arch=(i686 x86_64)
license=('LGPL')
url="http://live.gnome.org/libepc"
depends=('gtk3' 'avahi' 'libsoup')
makedepends=('intltool')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.4/${pkgname}-${pkgver}.tar.xz)
sha256sums=('3dff25a7f2f0d024b7609389f13664789b0ab45a0e5740908395e3d49cceefc2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


