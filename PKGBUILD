# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=hal-info
_date=20091130
pkgver=0.${_date}
pkgrel=3
pkgdesc="Hardware Abstraction Layer information files"
arch=(any)
options=('!emptydirs')
license=('GPL' 'custom')
url="http://www.freedesktop.org/wiki/Software/hal"
source=(http://hal.freedesktop.org/releases/hal-info-${_date}.tar.gz)
md5sums=('34375489a02a00b250fdc0b280be11b8')

build() {
  cd "${srcdir}/${pkgname}-${_date}"
  ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--enable-killswitch-dell-wlan=no \
	--enable-killswitch-dell-bluetooth=no \
	--enable-killswitch-dell-wwan=no
  make
}
 
package() {
  cd "${srcdir}/${pkgname}-${_date}"
  make DESTDIR=${pkgdir} install 
}
