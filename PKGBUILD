_pypiname="crayons"
pkgbase="python-$_pypiname"
pkgname=("python-$_pypiname" "python2-$_pypiname")
pkgver=0.1.0
pkgrel=2
pkgdesc="Text UI colors for Python"
url="https://github.com/kennethreitz/crayons"
makedepends=("python-setuptools" "python2-setuptools")
source=("https://github.com/kennethreitz/crayons/archive/v$pkgver.tar.gz")
license=("MIT")
arch=("any")

build() {
    cd "$srcdir"
    cp -r "$_pypiname-$pkgver" "$_pypiname-$pkgver-py2"
}

package_python-crayons() {
    depends=("python" "python-colorama")
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --prefix="/usr" --root="$pkgdir" -O1
}

package_python2-crayons() {
    depends=("python2" "python2-colorama")
    cd "$srcdir/$_pypiname-$pkgver-py2"
    python2 setup.py install --prefix="/usr" --root="$pkgdir" -O1
}
sha256sums=('73d85be6e18e4646b12d2efa30471e4f8fec12e6e9f4d98fdfec46608744c74e')
