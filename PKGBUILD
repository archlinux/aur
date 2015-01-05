pkgname=python-pycares
_pkgname=pycares
pkgver=0.6.3
pkgrel=1
pkgdesc="A python interface for c-ares"
arch=('i686' 'x86_64')
url="https://github.com/saghul/pycares"
license=('MIT')
depends=('python')

source=("https://github.com/saghul/$_pkgname/archive/$_pkgname-${pkgver}.tar.gz")
sha512sums=('92b53ccddd7c06e701807af6b62aec147701c45c3a32f617674480d01a6998e17645346c225bb7500f8a4ec87cf172c730e9cb05c9baadeec809ffcacea5eac2')

build() {
    cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
    python setup.py build_ext --inplace
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
