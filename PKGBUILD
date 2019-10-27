# Maintainer: Camas Millar <camas at hotmail dot co dot uk>

pkgname=python-setuptools-git-ver
_name=${pkgname#python-}
pkgver=1.0.4
pkgrel=1
pkgdesc="Automatically set package version using git tag/hash"
arch=('any')
url="https://github.com/camas/setuptools-git-ver"
license=('MIT')
depends=('python>=3.7' 'python-setuptools') 
provides=('python-setuptools-git-ver')
conflicts=('python-setuptools-git-ver')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('07b57167e9fc2359850195f76a230de2440fc92245351c523865690e70395a08')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

