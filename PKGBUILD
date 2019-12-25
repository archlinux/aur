# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=squawk
pkgver=0.1.2
pkgrel=1
pkgdesc="An XMPP desktop messenger, written on qt"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/squawk"
license=('GPL3')
depends=('hicolor-icon-theme' 'desktop-file-utils' 'lmdb' 'qxmpp>=1.1.0')
makedepends=('cmake>=3.3' 'imagemagick' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('9f89f41e52047c0e687a0a1b766331c19747c11f8f329e540402eaddbca4b677')
build() {
        cd "$srcdir/squawk"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build . -j $nproc
}
package() {
        cd "$srcdir/squawk"
        DESTDIR="$pkgdir/" cmake --build . --target install 
}
