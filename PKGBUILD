# Contributor: Fixed Torres <aur_linuxero@outlook.com>
# Maintainer: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player-git
pkgver=0.8.3_git0_20160424
pkgrel=1
pkgdesc="Is a small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=('i686' 'x86_64')
url="http://sayonara-player.com"
license=('GPL3')
depends=('qt5-base' 'taglib' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'libmtp')
optdepends=('lame' 'gst-plugins-ugly')
makedepends=('cmake' 'qt5-tools')
conflicts=('sayonara-player-svn' 'sayonara-player')
source=("${pkgname}::git+https://git.sayonara-player.com/sayonara.git")
 
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
sha384sums=('SKIP')
