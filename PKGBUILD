# Contributor: Fixed Torres <aur_linuxero@outlook.com>
# Maintainer: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player
pkgver=0.9.3.git1.20170502
_pkgver=0.9.3-git1-20170502
pkgrel=1
pkgdesc="Is a small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=('i686' 'x86_64')
url="http://sayonara-player.com"
license=('GPL3')
depends=('qt5-base' 'taglib' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'libmtp' 'zlib')
optdepends=('lame' 'gst-plugins-ugly')
makedepends=('cmake' 'qt5-tools')
conflicts=('sayonara-player-svn' 'sayonara-player-git')
source=("http://sayonara-player.com/sw/${pkgname}-${_pkgver}.tar.gz")
 
build() {
    cd "$srcdir/$pkgname"
	mkdir build
	cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE="Release"
    make
}
 
package() {
    cd "$srcdir/$pkgname"
	cd build
    make DESTDIR="$pkgdir/" install
}
sha512sums=('51d8003ca5a407c853c69a86398d0a7d1f0d6ae9b4d22cb714fa9ac7a1600bc4752744d3dc03eec5f07d3742a741167f27608b1a7227ffe209092987d9e85fa2')
