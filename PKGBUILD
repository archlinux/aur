# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_production_work
_name=trytond_production_work
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for production work"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1fa608f0445317819e04a67743bf23b3678ddfb5776d780b628fa5dae4331d00')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
