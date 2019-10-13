# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-matplotlib-pgfutils
pkgdesc="Utilities for generating PGF figures from Matplotlib"
pkgver=1.3.1
pkgrel=1
url="https://matplotlib-pgfutils.readthedocs.io/"
arch=('any')
depends=('python-matplotlib')
checkdepends=('python-pytest' 'python-pytest-cov' 'texlive-core')
license=('BSD')
source=("https://github.com/bcbnz/matplotlib-pgfutils/archive/v${pkgver}.tar.gz")
sha256sums=("f96265e17f8c71d76058783895256479be6e54ee7826eca4fbe040a71de2d87f")

build() {
    cd "matplotlib-pgfutils-${pkgver}"
    python setup.py build
}

check() {
    cd "matplotlib-pgfutils-${pkgver}"
    pytest
}

package() {
    cd "matplotlib-pgfutils-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
