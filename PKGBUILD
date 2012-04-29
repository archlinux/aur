# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-datetime-plugin
pkgver=0.6.1
pkgrel=3
pkgdesc="A date and time display plugin for the Xfce panel"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfce4-panel>=4.7.4' 'libxfcegui4')
makedepends=('intltool')
options=('!libtool')
source=(http://archive.xfce.org/src/panel-plugins/${pkgname}/0.6/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e82f51ff0e75a63e5cbd139e43e094f9')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib \
	--localstatedir=/var \
	--disable-static \
	--disable-static
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
