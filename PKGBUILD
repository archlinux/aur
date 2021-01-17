# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_shipment_cost
_name=trytond_sale_shipment_cost
pkgver=5.8.2
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for sale shipment cost"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e02b5b922fb3c684d985e66816a7b56f9f5df6478a50fe8498826cad0edc5bb8')
b2sums=('0c0b804958a3d4a8dd04983aa7ce4d104b779cdbb0d6ca14701fd0c00bf2e4369d44b50a094a1e21abbe75543984419d8b0844aaf8703f0693b048009cbd6d4f')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
