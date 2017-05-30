# Maintainer: Sebastien Leduc <sebastien AT sleduc DOT fr>

pkgname=('python-rpyc' 'python2-rpyc')
pkgbase='python-rpyc'
_realname=rpyc
pkgver=3.4.0
pkgrel=1
pkgdesc="Remote Python Call (RPyC), a transparent and symmetric RPC library"
url="http://rpyc.readthedocs.org"
arch=('any')
license=('MIT')
source=("https://pypi.python.org/packages/77/6d/41e01e49e75ec9a92e8637f8dc566cc01d5e6a76d4ce01f3bc54d4ff03f9/$_realname-$pkgver.tar.gz")
md5sums=('6bba886aa3ec37f1f4cabdb56c411eba')

package_python-rpyc() {
  depends=('python' 'python-plumbum')
  makedepends=("python-setuptools")
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

package_python2-rpyc() {
  depends=('python2' 'python2-plumbum')
  makedepends=("python2-setuptools")
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  mv "$pkgdir"/usr/bin/rpyc_classic{,2}.py
  mv "$pkgdir"/usr/bin/rpyc_registry{,2}.py
}
# vim:set ts=2 sw=2 et:
