# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Brendan Van Hook <brendan (at) vastactive (dot) com>

_pkgname=metakernel
pkgname=jupyter-$_pkgname
pkgver=0.27.5
pkgrel=1
pkgdesc="A Jupyter/IPython kernel template."
arch=('any')
url="https://github.com/Calysto/metakernel"
license=('BSD')
depends=('jupyter' 'ipython' 'python-pexpect')
makedepends=('python-setuptools')
source=("https://github.com/Calysto/metakernel/archive/${pkgver}.tar.gz")
sha256sums=('57e17012a673d14778b725df738be4b1e8aa4d7f5c6cbf9061abef7cfac9771c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
