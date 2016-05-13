# $Id:
# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot-audio
pkgver=0.1.1
pkgrel=1
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=('i686' 'x86_64')
url="http://openshot.org/"
license=('GPL3')
depends=('alsa-lib' 'freetype2' 'libxcursor' 'libxinerama' 'libxrandr')
makedepends=('cmake' 'doxygen')
source=("https://launchpad.net/libopenshot/0.1/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2d6737ea309e07c37605aa9b09aa92afa04923c22f74fb852a2b75d3838de633')

build() {
#	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
#	cd "${srcdir}/${pkgname}-${pkgver}/build"
        cd build
	make DESTDIR="${pkgdir}" install
}
