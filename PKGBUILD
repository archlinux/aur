pkgname=ronrunner
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight tournament scoring application for Mahjong"
arch=('any')
url="https://github.com/Didictateur/RonRunner"
license=('MIT')
depends=('python' 'tk')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/Didictateur/RonRunner.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}