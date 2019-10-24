# Maintainer: Camas Millar <camas at hotmail dot co dot uk>

pkgname=python-clicolor
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=2
pkgdesc="Quick python reference for terminal color escape codes"
arch=('any')
url="https://github.com/camas/clicolors"
license=('MIT')
depends=('python') 
makedepends=('python-setuptools')
provides=('python-clicolor')
conflicts=('python-clicolor')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ae6707506b5dcbe5f56501f104fc9b92b8e4f285bcb93d960a5acf966975ffa9')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

