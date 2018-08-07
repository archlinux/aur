# Maintainer: Sherlock Holo <sherlockya@gmail.com>
# Collaborator: user6553591 <Message on Reddit>

pkgname=python-websockets
pkgver=6.0
pkgrel=1
pkgdesc="An implementation of the WebSocket Protocol (RFC 6455)"
arch=('i686' 'x86_64')
url="https://github.com/aaugustin/websockets"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/aaugustin/websockets/archive/$pkgver.tar.gz")
sha256sums=('47bcad3e017925f8688512b4efa760807bf604a939c50c2926c40b0021247cf0')

build() {
    cd "$srcdir"/websockets-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/websockets-$pkgver
    python setup.py install --skip-build --optimize=1 --root="$pkgdir"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
