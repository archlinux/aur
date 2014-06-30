# Maintainer:
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-datetime-plugin
pkgver=0.6.2
pkgrel=2
pkgdesc="A date and time display plugin for the Xfce panel"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('intltool')
source=(http://archive.xfce.org/src/panel-plugins/${pkgname}/0.6/${pkgname}-${pkgver}.tar.bz2)
md5sums=('fe604a251eadbc5b0f2b4737b85d92c8')

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
