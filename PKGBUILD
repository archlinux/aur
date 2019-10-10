# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=squawk
pkgver=0.0.5
pkgrel=1
pkgdesc="An XMPP desktop messenger, written on qt"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/squawk"
license=('GPL3')
depends=('hicolor-icon-theme' 'desktop-file-utils' 'lmdb' 'qxmpp>=1.0.0')
makedepends=('cmake>=3.3' 'imagemagick' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('12bfc517574387257a82143d8970ec0d8d434ccd32f7ac400355ed5fa18192ab')
build() {
        cd "$srcdir/squawk"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr 
        cmake --build . -j $nproc
}
package() {
        cd "$srcdir/squawk"
        DESTDIR="$pkgdir/" cmake --build . --target install 
}
