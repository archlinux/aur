# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

pkgname=sayonara-player
pkgver=0.7.1_r189
_pkgver=r189
pkgrel=1
pkgdesc="Is a small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=('any')
url="http://sayonara-player.com"
license=('GPL3')
depends=('qt5-base' 'curl' 'taglib' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'libnotify')
optdepends=('lame' 'gst-plugins-ugly')
makedepends=('cmake')
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
sha256sums=('56e4d4ed22376f869344d66a38f8890693795a867b3a37c5d69669c3af56d776')
