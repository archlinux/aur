# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=supersmoother
pkgname=python-$_pyname
pkgver=0.3.2
pkgrel=1
pkgdesc="Python implementation of Friedman's Supersmoother"
url="http://github.com/jakevdp/supersmoother"
depends=('python-numpy')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('3de93a5ee64a9fba8db561fc90118f2e')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
