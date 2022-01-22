# Maintainer: Filipe Nascimento <flipee at tuta dot io>

_pkgname=pyxelate
pkgname=python-$_pkgname
pkgver=2.1.1
pkgrel=1
pkgdesc="Python class that generates pixel art from images"
arch=('any')
url="https://github.com/sedthh/pyxelate"
license=('MIT')
depends=('python-numba' 'python-scikit-image' 'python-scikit-learn')
makedepends=('git' 'python-setuptools')
source=("git+$url#commit=59000d1c342cff5a1d70438a843dd7ea88013e72")
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
