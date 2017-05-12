# $Id:
# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot-audio
pkgver=0.1.4
pkgrel=1
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=('i686' 'x86_64')
url="http://openshot.org/"
license=('GPL3')
depends=('alsa-lib' 'freetype2' 'libxcursor' 'libxinerama' 'libxrandr')
makedepends=('cmake' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/libopenshot-audio/archive/v$pkgver.tar.gz")
sha256sums=('3aa8cff51913a65e266b49699858fd5139b63817bd207145cf5699fe75d2459e')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cd build
	make DESTDIR="${pkgdir}" install
}
