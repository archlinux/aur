# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

pkgname=sayonara-player
pkgver=0.7.1_r188
_pkgver=r188
pkgrel=2
pkgdesc="Is a small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=('any')
url="http://sayonara-player.com"
license=('GPL3')
depends=('qt4' 'curl' 'taglib' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'libnotify')
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
sha256sums=('42a96bd212f5e5add204ac50c8d8fa015e61f233fc7ea74823383913a1fb6400')
