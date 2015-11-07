# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=msmtools
pkgname=python-$_pyname
pkgver=1.1
pkgrel=1
pkgdesc='Analysis of discrete Markov chains and Markov State Models'
url='https://pypi.python.org/pypi/msmtools'
depends=('python-scipy' 'python-six')
makedepends=('cython')
license=('LGPL3')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('9ad1da2d264c582d0126093884c7e83e')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
