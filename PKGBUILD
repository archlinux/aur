# Maintainer: Carl George < arch at cgtx dot us >

_name="easyargs"
_module="$_name"

pkgname=("python-$_module" "python2-$_module")
pkgver=0.9.4
pkgrel=1
pkgdesc="A python module to make handling command line arguments easy"
arch=("any")
url="https://github.com/stedmeister/easyargs"
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cc5638e2ca63183c9efb2b60d88c9ed1c1e338d41df45492dad078db4400aeb1')

build() {
    cd "$_name-$pkgver"
    python setup.py build
    python2 setup.py build
}

package_python-easyargs() {
    depends=("python-six")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

package_python2-easyargs() {
    depends=("python2-six")
    cd "$_name-$pkgver"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
