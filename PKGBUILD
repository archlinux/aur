# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_production_outsourcing
_name=trytond_production_outsourcing
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to outsource production"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2fee4582759db864e6716571a6346bf99519715fac8db2086354f8c8d87c5ee1')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
