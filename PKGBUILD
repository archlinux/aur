# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-matplotlib-pgfutils
pkgdesc="Utilities for generating PGF figures from Matplotlib"
pkgver=1.1.0
pkgrel=1
url="https://github.com/bcbnz/matplotlib-pgfutils"
arch=('any')
depends=('python-matplotlib>=1.2')
license=('BSD')
source=("https://github.com/bcbnz/matplotlib-pgfutils/archive/v${pkgver}.tar.gz")
sha256sums=("b67b22a7f7ea0663082168e2ab3c81094630e1134d983b950359b71e35a6cc29")

build() {
    cd "matplotlib-pgfutils-${pkgver}"
    python setup.py build
}

package() {
    cd "matplotlib-pgfutils-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
