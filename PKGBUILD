# Maintainer: Sherlock Holo <sherlockya@gmail.com>
# Collaborator: user6553591 <Message on Reddit>

pkgname=('python-websockets')
pkgver=3.4
pkgrel=1
pkgdesc="An implementation of the WebSocket Protocol (RFC 6455)"
arch=('any')
url="https://github.com/aaugustin/websockets"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/aaugustin/websockets/archive/$pkgver.tar.gz")
sha256sums=('c3ddd55c1a89ea52712be4fe643b4a60d79e28b9b789215b6f8dfb0dd113bc88')

build() {
    cd "$srcdir"/websockets-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/websockets-$pkgver
    python setup.py install --skip-build --optimize=1 --root="$pkgdir"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
