# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=mpldatacursor
pkgname=python-$_pyname
pkgver=0.6.1
pkgrel=1
pkgdesc='Interactive data cursors for Matplotlib'
url='https://pypi.python.org/pypi/mpldatacursor'
depends=('python-matplotlib')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('979d779cfb7d7b85ea234fb5ae9323ba')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
