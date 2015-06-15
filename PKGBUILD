pkgbase=python-pytty
pkgname=('python-pytty' 'python2-pytty')
pkgver=0.4
pkgrel=1
pkgdesc="POSIX serial port access module for Python"
arch=('any')
url="https://pypi.python.org/pypi/PyTTY"
license=('LGPL3')
makedepends=('python2' 'python')
source=(http://pypi.python.org/packages/source/P/PyTTY/PyTTY-$pkgver.tar.bz2)
sha256sums=('c85f73fdb4a428f73c189613c31424f3d3f83894d1d9429af72f09972dc57802')

build() {
  cp -a $srcdir/PyTTY-$pkgver $srcdir/Py2TTY-$pkgver
}

package_python2-pytty() {
  depends=('python2')

  cd $srcdir/Py2TTY-$pkgver
  python2 setup.py install --root=$pkgdir
  install -D -m644 LICENSE-LGPLv3 $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python-pytty() {
  depends=('python')

  cd $srcdir/PyTTY-$pkgver
  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE-LGPLv3 $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}