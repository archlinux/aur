# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

pkgname=sayonara-player
pkgver=0.7.1_r211
_pkgver=r211
pkgrel=2
pkgdesc="Is a small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=('i686' 'x86_64')
url="http://sayonara-player.com"
license=('GPL3')
depends=('qt5-base' 'curl' 'taglib' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'libnotify')
optdepends=('lame' 'gst-plugins-ugly')
makedepends=('cmake' 'qt5-tools')
conflicts=('sayonara-player-svn')
source=("http://sayonara-player.com/sw/${pkgname}-${_pkgver}.tar.gz")
 
build() {
        cd "$srcdir/$pkgname-$_pkgver"
	mkdir build
	cd build
        cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE="Release"
        make
}
 
package() {
        cd "$srcdir/$pkgname-$_pkgver"
	cd build
        make prefix=/usr DESTDIR="$pkgdir/" install
}
sha256sums=('8152afdd590fab3862e24de0bedbad539563157fe81d1308ba1587db2c9e98cd')
