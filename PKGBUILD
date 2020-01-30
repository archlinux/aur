# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=aria2p
pkgver=0.7.1
pkgrel=1
pkgdesc="Command-line tool and library to interact with an aria2c daemon process with JSON-RPC"
arch=('any')
url="https://github.com/pawamoy/$pkgname"
license=('ISC')
depends=('python' 'python-asciimatics' 'python-loguru' 'python-requests'
         'python-setuptools' 'python-websocket-client')
optdepends=('aria2: aria2c daemon')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")   
sha256sums=('248cd1e4e30537e475e9aa66bc4f7ba23bafdc973c34ad368a0860e035b4314a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
