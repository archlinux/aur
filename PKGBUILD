# Maintainer: Camas Millar <camas at hotmail dot co dot uk>

pkgname=python-clicolor
_name=${pkgname#python-}
pkgver=1.0.7
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
sha256sums=('cdd13b78654a6bb06486597c5292cdf0fe482cea1025e854b5256f0d159cd49a')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

