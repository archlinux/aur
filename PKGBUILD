# Maintainer: Camas Millar <camas at hotmail dot co dot uk>

pkgname=python-clicolor
_name=${pkgname#python-}
pkgver=1.0.6
pkgrel=1
pkgdesc="Quick python reference for terminal color escape codes"
arch=('any')
url="https://github.com/camas/clicolors"
license=('MIT')
depends=('python') 
makedepends=('python-setuptools')
provides=('python-clicolor')
conflicts=('python-clicolor')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a29994261c1c65aa0d05d8405ebd9b7b7ea1cb833696afc0eb0b5fc69c987d9b')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

