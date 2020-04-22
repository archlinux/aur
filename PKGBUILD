# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Brendan Van Hook <brendan (at) vastactive (dot) com>

_pkgname=metakernel
pkgname=jupyter-$_pkgname
pkgver=0.24.4
pkgrel=1
pkgdesc="A Jupyter/IPython kernel template."
arch=('any')
url="https://github.com/Calysto/metakernel"
license=('BSD')
depends=('jupyter' 'ipython' 'python-pexpect')
makedepends=('python-setuptools')
source=("https://github.com/Calysto/metakernel/archive/v${pkgver}.tar.gz")
sha256sums=('61066b0bd3dfb7fe69c7b8a915685722bdaadf9f346b2b8eaa547faeb97ecdd3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
