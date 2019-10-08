# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=squawk
pkgver=0.0.5
pkgrel=1
pkgdesc="An XMPP desktop messenger, written on qt"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/squawk"
license=('GPL3')
depends=('hicolor-icon-theme' 'desktop-file-utils' 'lmdb' 'qxmpp>=1.0.0')
makedepends=('cmake>=3.3' 'imagemagick')
source=("$pkgname-$pkgver.tar.gz")
sha1sums=('461aee46378c62c3f316e648d8c765794ef62f33')
build() {
        cd "$srcdir/squawk"
        cmake . -D SYSTEM_QXMPP:BOOL=True -D CMAKE_INSTALL_PREFIX=/usr -G Ninja
        cmake --build .
}
package() {
        cd "$srcdir/squawk"
        DESTDIR="$pkgdir/" cmake --build . --target install 
}
