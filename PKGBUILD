# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

_name=anyconfig-ion-backend
pkgname=python-$_name
pkgver=0.1.1
pkgrel=1
pkgdesc='A backend module for python-anyconfig to support to load and dump Amazon Ion data files.'
url='https://github.com/ssato/python-anyconfig-ion-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig' 'python-amazon.ion')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('632995d8e599ab47f63f316690cd91280eb5c4a8e91841e3bc6214ae5cec2ff4')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
