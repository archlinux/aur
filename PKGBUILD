# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_production_routing
_name=trytond_production_routing
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for production routing"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cbbe97adcb55742c994b55cde1fd497a0ed76958670c01bda134cf5e2c756935')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
