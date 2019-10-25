# Maintainer: Camas Millar <camas at hotmail dot co dot uk>

pkgname=python-setuptools-git-ver
_name=${pkgname#python-}
pkgver=1.0.3
pkgrel=1
pkgdesc="Automatically set package version using git tag/hash"
arch=('any')
url="https://github.com/camas/setuptools-git-ver"
license=('MIT')
depends=('python>=3.7' 'python-setuptools') 
provides=('python-setuptools-git-ver')
conflicts=('python-setuptools-git-ver')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f6db4b3b4136df9bae237729cfba3c0c798bc5d0d1be363d052957790981469e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

