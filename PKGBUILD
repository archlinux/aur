# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

pkgname=sayonara-player
pkgver=0.8.0_293
_pkgver=r293
pkgrel=1
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
        make DESTDIR="$pkgdir/" install
}
sha384sums=('f7f343a38596cf09b15cebc02939ad6a708054246903b6ec410a537333d6770cfe099fe97ba556560094dcd8a6d20e8a')
