# Maintainer: Camas Millar <camas at hotmail dot co dot uk>

pkgname=python-od
_name=${pkgname#python-}
pkgver=1.0
pkgrel=1
pkgdesc="Shorthand syntax for building OrderedDicts"
arch=('any')
url="https://github.com/epsy/od/"
license=('MIT')
depends=('python') 
makedepends=('python-setuptools')
provides=('python-od')
conflicts=('python-od')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d1c94cd3af5fdb13ca27c4d3e1601c77028f36bbba9e78c324daf0c1ac06e3ab')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

