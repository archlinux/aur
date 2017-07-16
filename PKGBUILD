# Maintainer: Brendan Van Hook <brendan at vastactive dot com>

_pkgname=metakernel
pkgname=jupyter-$_pkgname
pkgver=0.20.4
pkgrel=2
pkgdesc="A Jupyter/IPython kernel template."
arch=('any')
url="https://github.com/Calysto/metakernel"
license=('BSD')
depends=('jupyter' 'ipython' 'python-pexpect')
makedepends=('python-setuptools')
source=("https://github.com/Calysto/metakernel/archive/v${pkgver}.tar.gz")
md5sums=('6059e4407476ffbb06106ee7d54b9795')

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
