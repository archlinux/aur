# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

_name=anyconfig-json5-backend
pkgname=python-$_name
pkgver=0.2.0
pkgrel=1
pkgdesc="AA backend module for python-anyconfig to support to load and dump JSON5 (JSON for humans) data"
url='https://github.com/ssato/python-anyconfig-json5-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('418f767a3151a9311cd538446bf4f67590fe3b2164fe67f1bee0794532c54481')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
