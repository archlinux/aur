# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=corner
pkgname=python-$_pyname
pkgver=1.0.0
pkgrel=1
pkgdesc='Make some beautiful corner plots of samples'
url="https://github.com/dfm/corner.py"
depends=('python-matplotlib')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('608aaf1afa65dbd55ea52c48302b2b91')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
