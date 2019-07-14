# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_country
_name=trytond_country
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module with countries"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7f0fd15a0aa69152bf58f2d6d3f0267cf7d33e743bc786a706377f209c244f6c')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
