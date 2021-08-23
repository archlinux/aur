# Maintainer: DrasLorus <draslorus@draslorus.fr>
pkgname=python-scikit-commpy
pkgver=0.7.0
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
sha256sums=('49a762751a9b2f65b6a921b9bfaad23c32d570d4fef0f3c8ab5481f2650b2dcb')

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
