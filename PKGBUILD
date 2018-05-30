# Maintainer: Sherlock Holo <sherlockya@gmail.com>
# Collaborator: user6553591 <Message on Reddit>

pkgname=python-websockets
pkgver=5.0.1
pkgrel=1
pkgdesc="An implementation of the WebSocket Protocol (RFC 6455)"
arch=('i686' 'x86_64')
url="https://github.com/aaugustin/websockets"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/aaugustin/websockets/archive/$pkgver.tar.gz")
sha256sums=('e1e1c1213016c6ab71f7a5affd8f3a51bfb87089a72ad8216fe558c5572892c3')

build() {
    cd "$srcdir"/websockets-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/websockets-$pkgver
    python setup.py install --skip-build --optimize=1 --root="$pkgdir"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
