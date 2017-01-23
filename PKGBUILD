# Maintainer: Carl George < arch at cgtx dot us >

_name="easyargs"
_module="$_name"

pkgname=("python-$_module" "python2-$_module")
pkgver=0.9.3
pkgrel=1
pkgdesc="A python module to make handling command line arguments easy"
arch=("any")
url="https://github.com/stedmeister/easyargs"
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('41b02094f7c51ecdea2ff8c381913dba397f6a36280cd70f076505d8a1bce473')

build() {
    cd "$_name-$pkgver"
    python setup.py build
    python2 setup.py build
}

package_python-easyargs() {
    depends=("python-six")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}

package_python2-easyargs() {
    depends=("python2-six")
    cd "$_name-$pkgver"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
