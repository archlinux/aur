# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Foster McLane <fkmclane@gmail.com>
# Contributor: Jonathan Thomas <jonathan@openshot.org>

pkgname=libopenshot
pkgver=0.1.1
pkgrel=1
pkgdesc="A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby."
arch=('i686' 'x86_64')
url="http://openshot.org/"
license=('LGPL3')
depends=('imagemagick' 'ffmpeg' 'libx264' 'libopenshot-audio' 'python' 'qt5-base' 'qt5-multimedia' 'ruby')
makedepends=('cmake' 'doxygen' 'swig' 'unittestpp')
source=("https://launchpad.net/libopenshot/0.1/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7f79084b0fda085ee5740f4907a2ac4bd736de6b3c4958b4441f49eaedfc7eee')

build() {
#	cd ${pkgname}-${pkgver}
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DMAGICKCORE_HDRI_ENABLE=1 -DMAGICKCORE_QUANTUM_DEPTH=16 ../
	make
}

package() {
#	cd ${pkgname}-${pkgver}
        cd build
	make DESTDIR="${pkgdir}" install
}

