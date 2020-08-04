# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_production_outsourcing
_name=trytond_production_outsourcing
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to outsource production"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6a4033edb18f8015a639eee48c1c51d3d347a8fd4aa2bbb303a8a45efe1c6370')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
