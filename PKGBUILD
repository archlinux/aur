pkgname=python-pycares
_pkgname=pycares
pkgver=3.0.0
pkgrel=1
pkgdesc="A python interface for c-ares"
arch=('i686' 'x86_64')
url="https://github.com/saghul/pycares"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

source=("https://github.com/saghul/$_pkgname/archive/$_pkgname-${pkgver}.tar.gz")
sha512sums=('bf60549044686accae68ed118e6c5e0da07b1d13473b70f91db85693ebd9ac9e4afb87cba763c667f2f7f487de28759e26a1677023081e94311b547a51bf7451')

build() {
    cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
    python setup.py build_ext --inplace
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
