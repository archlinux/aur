# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=aria2p
pkgver=0.10.3
pkgrel=1
pkgdesc="Command-line tool and library to interact with an aria2c daemon process with JSON-RPC"
arch=('any')
url="https://pawamoy.github.io/showcase/aria2p"
license=('ISC')
depends=('python-loguru' 'python-requests'
         'python-toml' 'python-websocket-client' )
optdepends=('aria2: aria2c daemon'
            'python-appdirs: interactive interface support'
            'python-asciimatics: interactive interface support'
            'python-pyperclip: interactive interface support')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('bd9471d9bc51a5a51abf6efd365242c0454db85e60a2efd929ef938558b998f5')

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
