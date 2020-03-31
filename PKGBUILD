# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=squawk
pkgver=0.1.3
pkgrel=1
pkgdesc="An XMPP desktop messenger, written on pure c++ (qt)"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/squawk"
license=('GPL3')
depends=('hicolor-icon-theme' 'desktop-file-utils' 'lmdb' 'qxmpp>=1.1.0')
makedepends=('cmake>=3.3' 'imagemagick' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('adb172bb7d5b81bd9b83b192481a79ac985877e81604f401b3f2a08613b359bc')
build() {
        cd "$srcdir/squawk"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build . -j $nproc
}
package() {
        cd "$srcdir/squawk"
        DESTDIR="$pkgdir/" cmake --build . --target install 
}
