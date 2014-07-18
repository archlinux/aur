# $Id:
# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot-audio
_pkgname=libopenshot-audio1
pkgver=0.0.2
pkgrel=2
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=('i686' 'x86_64')
url="http://openshot.org/"
license=('GPL3')
depends=('alsa-lib' 'freetype2' 'libx11' 'libxcursor' 'libxinerama')
makedepends=('cmake')
source=("https://launchpad.net/libopenshot/0.0/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz")
md5sums=('adfd4fd1b0d1731a1e336c4f3628d033')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
