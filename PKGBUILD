# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_production
_name=trytond_production
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for production"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8f2d417913675c1590f3b10bddc5b7bfe20c303e30772f34132bd2a1568b9347')
b2sums=('587c27594097208eed70efb0efe2ac6c3d5f12cc5618cf2992f4b996881f5ac4a30aa816c35789fa444203ac4cbf78294e7cb8c3cc124100eb9bf82cd8b4cbcf')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
