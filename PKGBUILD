# Maintainer: Camas Millar <camas at hotmail dot co dot uk>

pkgname=python-clicolor
_name=${pkgname#python-}
pkgver=1.0.3
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
sha256sums=('a6ae16c50122e62e2fd97f094726c8ef505dbfa4f805a58a75ee9e0723f32e3b')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

