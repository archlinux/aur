# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

_name=anyconfig-bson-backend
pkgname=python-$_name
pkgver=0.1.2
pkgrel=1
pkgdesc='A parser backend module for python-anyconfig to load and dump BSON files using pymongo.'
url='https://github.com/ssato/python-anyconfig-bson-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig' 'python-pymongo')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8e719d6297544dab92458e4f3d03e4421af5de5546a699a12699f3db0c453e09')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
