# $Id:
# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot-audio
pkgver=0.0.4
pkgrel=1
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=('i686' 'x86_64')
url="http://openshot.org/"
license=('GPL3')
depends=('alsa-lib' 'freetype2' 'libx11' 'libxcursor' 'libxinerama')
makedepends=('cmake')
source=("https://launchpad.net/libopenshot/0.0/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('66086c5ff1cb5cc6a499f84888d07ad03a31b30105213fb5b578909707acbb2b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
