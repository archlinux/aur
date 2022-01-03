# Maintainer: Filipe Nascimento <flipee at tuta dot io>

_pkgname=pyxelate
pkgname=python-$_pkgname
pkgver=2.1.0
pkgrel=1
pkgdesc="A Python class that downsamples images into 8-bit pixel arts"
arch=('any')
url="https://github.com/sedthh/pyxelate"
license=('MIT')
depends=('python-numba' 'python-scikit-image' 'python-scikit-learn')
makedepends=('git' 'python-setuptools')
source=("git+$url#commit=a4ae371c86de8d9619d2360376cb9e63ec9a04be")
sha256sums=('SKIP')

build() {
    cd $_pkgname
    python setup.py build
}

package() {
    cd $_pkgname
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
