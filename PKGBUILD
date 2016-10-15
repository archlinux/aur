# Contributor: Fixed Torres <aur_linuxero@outlook.com>
# Maintainer: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player
pkgver=0.9.2.git8.20161013
_pkgver=0.9.2-git8-20161013
pkgrel=2
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
sha512sums=('81ad7c8e5ee2cf5c99b1f5d318ac82a3db8de77af110ac7244da1451fe79b2cd7d9fed1279f0aba17086c8be8f20972a2add6ed9f6e33d5c2bc1e2919c8be333')
