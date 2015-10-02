pkgname=python-pycares
_pkgname=pycares
pkgver=1.0.0
pkgrel=1
pkgdesc="A python interface for c-ares"
arch=('i686' 'x86_64')
url="https://github.com/saghul/pycares"
license=('MIT')
depends=('python')

source=("https://github.com/saghul/$_pkgname/archive/$_pkgname-${pkgver}.tar.gz")
sha512sums=('203d340e78c70c369c5f287560bddd902c29b4661a63730ea86654bc1848ba9e8326545a71b89ee824aed9550d9b19c52209493b7de27dc0eb982edf0430825e')

build() {
    cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
    python setup.py build_ext --inplace
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
