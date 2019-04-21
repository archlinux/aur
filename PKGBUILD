# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-matplotlib-pgfutils
pkgdesc="Utilities for generating PGF figures from Matplotlib"
pkgver=1.0.0
pkgrel=1
url="https://github.com/bcbnz/matplotlib-pgfutils"
arch=('any')
depends=('python-matplotlib>=1.2')
license=('BSD')
source=("https://github.com/bcbnz/matplotlib-pgfutils/archive/v${pkgver}.tar.gz")
sha256sums=("9cada01e4559f2e43f75dff562f7a209f0185ed990d61428c5b21bc9bf9b1daf")

build() {
    cd "matplotlib-pgfutils-${pkgver}"
    python setup.py build
}

package() {
    cd "matplotlib-pgfutils-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
