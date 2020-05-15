# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=aria2p
pkgver=0.9.1
pkgrel=1
pkgdesc="Command-line tool and library to interact with an aria2c daemon process with JSON-RPC"
arch=('any')
url="https://github.com/pawamoy/$pkgname"
license=('ISC')
depends=('python-loguru' 'python-requests' 'python-websocket-client')
optdepends=('aria2: aria2c daemon'
            'python-asciimatics: interactive interface support')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f9b680c2c0d954ba7f483c6f9836104b423283136a63aeaf9606c259d45c4f45')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
