# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase_requisition
_name=trytond_purchase_requisition
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Allows users to enter requests for product supply (requisition). This will create a "Purchase request" by line which will be treated by the purchasing department."
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('26b34c52b1eda9109496ab000875bf9c4530edc99e50b409e4c1ca1576f1b452')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
