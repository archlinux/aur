# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=msmtools
pkgname=python-$_pyname
pkgver=1.1.2
pkgrel=1
pkgdesc='Analysis of discrete Markov chains and Markov State Models'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python-decorator' 'python-scipy' 'python-six')
makedepends=('cython')
license=('LGPL3')
arch=('i686' 'x86_64')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('8bb5ed8360de63b15a272a64472bf48a')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

check() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py test
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
