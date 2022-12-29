# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=certstream-python
pkgname=python-certstream
pkgver=1.12
pkgrel=1
pkgdesc="Library for receiving certificate transparency list updates in real time"
url="https://github.com/CaliDog/certstream-python"
depends=('python'
         'python-websocket-client>=0.58.0'
         'python-termcolor')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/CaliDog/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('8ab2582627bd4aba1a173e3296ff6f57572464da6ef817f6d1ed22accb6a4885aad871efc9878e2371dbc123f87992f5f9f2d86c618e84de8652c6e5257f4aff')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

