# Contributor: Fixed Torres <aur_linuxero@outlook.com>
# Maintainer: Fixed Torres <aur_linuxero@outlook.com>

pkgname=sayonara-player
pkgver=1.0.0_20171230
_pkgver=1.0.0-git0-20171230
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
sha512sums=('643b831d9e21ef05e20dcc3f5a89593da42463683cfcbf1d6f693a28c66d3c56484636597dbcf10537b59190ff7d0c65ee28a76afd8b2f8d0078074af839fcb3')
