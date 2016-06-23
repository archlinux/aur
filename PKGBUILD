# Maintainer: Brendan Van Hook <brendan at vastactive dot com>

_pkgname=metakernel
pkgname=jupyter-$_pkgname
pkgver=0.13.1
pkgrel=1
pkgdesc="A Jupyter/IPython kernel template."
arch=('any')
url="https://github.com/Calysto/metakernel"
license=('BSD')
depends=('python' 'jupyter' 'ipython')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/50/26/b0f1425859f3fb1e11e965d8baf24d32ad353fc9f01bba5aa9bf73d11af2/metakernel-0.13.1.tar.gz)
md5sums=('3f71394a98730c3653a2d3df4448adf8')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
