pkgbase=python-voluptuous
pkgname=('python-voluptuous' 'python2-voluptuous')
pkgver=0.9.3
pkgrel=2
pkgdesc="Voluptuous is a Python data validation library"
arch=('any')
url='https://pypi.python.org/pypi/voluptuous'
license=('BSD')
source=(https://pypi.python.org/packages/e6/5d/2b9ed56f2e69fe54cf00d07b7b3b9b43e8c9763dff3015365bd4c3f6f2a6/voluptuous-0.9.3.tar.gz)
md5sums=('3dfccea158f4d48c1b7ad23d48eabb6e')
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
