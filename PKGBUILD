pkgbase=python-voluptuous
pkgname=('python-voluptuous' 'python2-voluptuous')
pkgver=0.10.5
pkgrel=1
pkgdesc="Voluptuous is a Python data validation library"
arch=('any')
url='https://pypi.python.org/pypi/voluptuous'
license=('BSD')
source=(https://pypi.python.org/packages/c3/81/c84f8a3e723b760fdd1c41fc80201cb80cd29c1bce5159d8918c58df7d2a/voluptuous-0.10.5.tar.gz)
md5sums=('e3fc99b75618d384cad63bc71b6507bc')
makedepends=('python2' 'python' 'python-setuptools' 'python2-setuptools')

package_python-voluptuous() {
  depends=('python')

  cd $srcdir/voluptuous-$pkgver
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  python setup.py install --root=$pkgdir
  chmod a+r -R $pkgdir/usr/lib/python3.6/site-packages/voluptuous-$pkgver-py3.6.egg-info
}

package_python2-voluptuous() {
  depends=('python2')

  cd $srcdir/voluptuous-$pkgver
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  python2 setup.py install --root=$pkgdir
  chmod a+r -R $pkgdir/usr/lib/python2.7/site-packages/voluptuous-$pkgver-py2.7.egg-info
}
