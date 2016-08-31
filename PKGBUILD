# $Id:
# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot-audio
pkgver=0.1.2
pkgrel=1
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=('i686' 'x86_64')
url="http://openshot.org/"
license=('GPL3')
depends=('alsa-lib' 'freetype2' 'libxcursor' 'libxinerama' 'libxrandr')
makedepends=('cmake' 'doxygen')
source=("https://launchpad.net/libopenshot/0.1/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ec587ceed6b8d0d8de455b222fdb75832e67779e1a7b80925e86709353099e8a')

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
