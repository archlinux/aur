# $Id: PKGBUILD, v1.0 2013/05/22 22:05:00 wh Exp $
# Maintainer: niskii <esqueleto_bajo[a_snail_sign]outlook[dot]com>

pkgname=mmsap
pkgver=3.2.5
pkgrel=3
pkgdesc="Comfortable SAP player based on ASAP library"
url="http://mmsap.sourceforge.net"
depends=(gtkmm3 alsa-lib)
makedepends=(cmake libglade asap dbus-glib)
arch=('i686' 'x86_64')
license=('GPL')
source=("http://downloads.sourceforge.net/mmsap/${pkgname}_${pkgver}.tar.bz2")
conflicts=('mmsap2')
md5sums=('ad585f4d16ba268a0d0c52f36d128983')

build(){
	cd ${srcdir}/${pkgname}_${pkgver}/
	cmake . -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}_${pkgver}/
	make install
}
