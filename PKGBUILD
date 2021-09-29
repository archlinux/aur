pkgname="python-pyaxmlparser"
pkgver=0.3.26
pkgrel=2
pkgdesc='Parser for Android XML file and get Application Name without using Androguard '
arch=('any')
url='https://github.com/appknox/pyaxmlparser'
makedepends=('python-setuptools')
depends=('python' 'python-lxml' 'python-click')
license=('MIT')
source=("pyaxmlparser-${pkgver}.tar.gz::https://github.com/appknox/pyaxmlparser/archive/v${pkgver}.tar.gz")
md5sums=('36ebeb626f5212169116e2658584550d')

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
