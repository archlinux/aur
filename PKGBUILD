pkgname=python-pycares
_pkgname=pycares
pkgver=2.3.0
pkgrel=1
pkgdesc="A python interface for c-ares"
arch=('i686' 'x86_64')
url="https://github.com/saghul/pycares"
license=('MIT')
depends=('python')

source=("https://github.com/saghul/$_pkgname/archive/$_pkgname-${pkgver}.tar.gz")
sha512sums=('d9a910b529d3b070b1685f6d89458404f22a5aa7002b01c1772f3eff548e9764826454c41bb69bf2f5b663df39cd1fb71b599b5f1ea88e197218e02942af67c7')

build() {
    cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
    python setup.py build_ext --inplace
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
