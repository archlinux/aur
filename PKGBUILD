# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=squawk
pkgver=0.2.3
pkgrel=1
pkgdesc="An XMPP desktop messenger, written on pure c++ (qt)"
arch=('i686' 'x86_64')
url="https://git.macaw.me/blue/squawk"
license=('GPL3')
depends=('hicolor-icon-theme' 'desktop-file-utils' 'lmdbal' 'qxmpp-qt5')
makedepends=('cmake>=3.3' 'imagemagick' 'qt5-tools' 'boost')
optdepends=('kwallet5: secure password storage (requires rebuild)'
            'kconfig5: system themes support (requires rebuild)'
            'kconfigwidgets5: system themes support (requires rebuild)'
            'kio5: better show in folder action (requires rebuild)')

source=("$pkgname-$pkgver.tar.gz::https://git.macaw.me/blue/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('4c48aaa59cf7744c931f446ca32eb9df3575583029951fd3f48a18e0eb3530d3')
build() {
        cd "$srcdir/squawk"
        cmake . -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release
        cmake --build .
}
package() {
        cd "$srcdir/squawk"
        DESTDIR="$pkgdir/" cmake --install .
}
