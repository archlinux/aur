# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: skydrome <skydrome@i2pmail.org>
# Contributor: MTsoul

pkgname=libwebsocketpp-git
pkgver=0.3.0.r0.ge203dbe
pkgrel=1
pkgdesc="C++/Boost Asio based websocket client/server library"
url="https://github.com/zaphoyd/websocketpp"
license=('BSD')
arch=('any')
makedepends=('git' 'cmake')
source=("git://github.com/zaphoyd/websocketpp.git")

md5sums=('SKIP')

pkgver() {
    cd "$srcdir/websocketpp"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/websocketpp"
    cmake -DCMAKE_INSTALL_PREFIX="/usr"
}

package() {
    cd "$srcdir/websocketpp"
    make DESTDIR="$pkgdir" install
}
