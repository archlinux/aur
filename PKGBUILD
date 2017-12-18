# Maintainer: Sherlock Holo <sherlockya@gmail.com>
# Collaborator: user6553591 <Message on Reddit>

pkgname=('python-websockets')
pkgver=4.0.1
pkgrel=1
pkgdesc="An implementation of the WebSocket Protocol (RFC 6455)"
arch=('i686' 'x86_64')
url="https://github.com/aaugustin/websockets"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/aaugustin/websockets/archive/$pkgver.tar.gz")
sha256sums=('da5068655b1ba5487dbdf36919c54c5721aa148c6388077c18b923b539aafddc')

build() {
    cd "$srcdir"/websockets-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/websockets-$pkgver
    python setup.py install --skip-build --optimize=1 --root="$pkgdir"
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
