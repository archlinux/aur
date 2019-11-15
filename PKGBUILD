# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=squawk
pkgver=0.1.1
pkgrel=1
pkgdesc="An XMPP desktop messenger, written on qt"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/squawk"
license=('GPL3')
depends=('hicolor-icon-theme' 'desktop-file-utils' 'lmdb' 'qxmpp>=1.1.0')
makedepends=('cmake>=3.3' 'imagemagick' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('d0448f2fdb321e31a40c08b77adc951bafe8d1c271f70d6ffc80fb17cef670cf')
build() {
        cd "$srcdir/squawk"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build . -j $nproc
}
package() {
        cd "$srcdir/squawk"
        DESTDIR="$pkgdir/" cmake --build . --target install 
}
