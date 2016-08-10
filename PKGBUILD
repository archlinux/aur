# Maintainer: Brendan Van Hook <brendan at vastactive dot com>

_pkgname=metakernel
pkgname=jupyter-$_pkgname
pkgver=0.13.4
pkgrel=1
pkgdesc="A Jupyter/IPython kernel template."
arch=('any')
url="https://github.com/Calysto/metakernel"
license=('BSD')
depends=('python' 'jupyter' 'ipython')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/42/40/45cdf097e7c9445ad43ce6b61bc4cbae8c4994367f8ef015ed1bb14550a9/metakernel-0.13.4.tar.gz)
md5sums=('6e38ae9d55df804f22e50b5631ceac5f')

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
