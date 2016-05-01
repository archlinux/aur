# Contributor: Fixed Torres <aur_linuxero@outlook.com>
# Maintainer: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player
pkgver=0.8.3_git2_20160501
_pkgver=0.8.3-git2-20160501
pkgrel=1
pkgdesc="Is a small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=('i686' 'x86_64')
url="http://sayonara-player.com"
license=('GPL3')
depends=('qt5-base' 'taglib' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'libmtp')
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
sha512sums=('395ce41e6261a426814229c70578c4fe17c58ceb5c9bd8f067be4a4db920091f1c45f76ac62e07ea49438d0e6c427aaf5766b69451631187368478188e18f779')
