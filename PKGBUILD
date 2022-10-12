# Maintainer: DrasLorus <draslorus@draslorus.fr>
pkgname=python-scikit-commpy
pkgver=0.8.0
pkgrel=1
epoch=
pkgdesc="An open source toolkit implementing digital communications algorithms in Python"
arch=('any')
url="https://github.com/veeresht/CommPy"
license=('BSD')
groups=()
depends=('python'
    'python-nose'
    'python-scipy'
    'python-numpy'
    'python-sympy'
    'python-matplotlib')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/veeresht/CommPy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b6b345009b2a7d9248a1e6de68898d67102727dac3c92863b00e925bdb46398')

prepare() {
    ln -sfv "$srcdir/CommPy-$pkgver" "$srcdir/$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    mkdir -pv "$pkgdir/usr/share/licenses/$pkgname"
    cp -v "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
