# Maintainer: Sebastien Leduc <sebastien AT sleduc DOT fr>

pkgname=('python-rpyc' 'python2-rpyc')
pkgbase='python-rpyc'
_realname=rpyc
pkgver=4.1.5
pkgrel=1
pkgdesc="Remote Python Call (RPyC), a transparent and symmetric RPC library"
url="http://rpyc.readthedocs.org"
arch=('any')
license=('MIT')
source=("https://github.com/tomerfiliba-org/${_realname}/archive/${pkgver}.tar.gz")
md5sums=('3f1d864da58341ae1477790304f09097')
makedepends=("python-setuptools" "python2-setuptools")

package_python-rpyc() {
  depends=('python' 'python-plumbum')
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

package_python2-rpyc() {
  depends=('python2' 'python2-plumbum')
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  mv "$pkgdir"/usr/bin/rpyc_classic{,2}.py
  mv "$pkgdir"/usr/bin/rpyc_registry{,2}.py
}
# vim:set ts=2 sw=2 et:
