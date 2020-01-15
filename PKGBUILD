# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=viscm
pkgname=python-$_pyname
pkgver=0.9
pkgrel=1
pkgdesc='A colormap tool'
url='https://pypi.python.org/pypi/viscm/'
depends=('python-matplotlib' 'python-colorspacious')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz"
        'LICENSE')
md5sums=('4284331c77c917ded6b85dbc5e66c931'
         '5f55a94c837657a48d83f91fdc6529f7')


build() {
  cd "$_pyname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pyname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
