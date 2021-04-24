# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

_name=anyconfig-fortios-backend
pkgname=python-$_name
pkgver=0.1.7
pkgrel=1
pkgdesc="A backend module for python-anyconfig to support to load and parse fortios' 'show \*configuration' outputs"
url='https://github.com/ssato/python-anyconfig-fortios-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('683ae07af8cabbd6a663b248124077545fc77796bd3b7631aa6f03fd99bdc567')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
