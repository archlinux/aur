# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Sebastien Leduc <sebastien AT sleduc DOT fr>

pkgname=('python-rpyc-330' 'python2-rpyc-330')
pkgbase='python-rpyc-330'
_pythonmod=rpyc
pkgver=3.3.0
pkgrel=1
pkgdesc="Remote Python Call (RPyC), a transparent and symmetric RPC library"
url="http://rpyc.readthedocs.org"
arch=('any')
license=('MIT')
source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('6931cb92c41f547591b525142ccaeef1')

package_python-rpyc-330() {
  depends=('python' 'python-plumbum')
  makedepends=("python-setuptools")
  provides=('python-rpyc=3.3.0')
  conflicts=('python-rpyc')
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}

package_python2-rpyc-330() {
  depends=('python2' 'python2-plumbum')
  makedepends=("python2-setuptools")
  provides=('python2-rpyc=3.3.0')
  conflicts=('python2-rpyc')
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  mv "$pkgdir"/usr/bin/rpyc_classic{,2}.py
  mv "$pkgdir"/usr/bin/rpyc_registry{,2}.py
}
# vim:set ts=2 sw=2 et:
