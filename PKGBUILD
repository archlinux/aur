# Contributor: Fixed Torres <aur_linuxero@outlook.com>
# Maintainer: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player
pkgver=1.4.1_stable1
_pkgver=1.4.1-stable1
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
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE="Release"
    make
}
 
package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir/" install
}
sha512sums=('5ea8f9677f649c8a018ce9c46c5149da7781288aaebe892856537098a399ae6479822e7a77f4d5ac91150735a47699fdf440d84fd382e4263fcb1bd1cc8af526')
