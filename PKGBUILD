pkgname="python-pyaxmlparser"
pkgver=0.3.13
pkgrel=2
pkgdesc='Parser for Android XML file and get Application Name without using Androguard '
arch=('any')
url='https://github.com/appknox/pyaxmlparser'
makedepends=('python-setuptools')
depends=('python' 'python-lxml' 'python-click')
license=('MIT')
source=("pyaxmlparser-${pkgver}.tar.gz::https://github.com/appknox/pyaxmlparser/archive/v${pkgver}.tar.gz")
md5sums=('9b82d3bdd730d4470af03d81a3e77b90')

prepare() {
    sed -i "s#click==6.7#click#g" "$srcdir/pyaxmlparser-$pkgver/setup.py"
}

build() {
    cd "$srcdir/pyaxmlparser-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyaxmlparser-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
