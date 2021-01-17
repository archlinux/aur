# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_shipment_tolerance
_name=trytond_sale_shipment_tolerance
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to define tolerance for sale shipment"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8d8cb752d1b5b89cd8d71ff362aa83287c5f09b49843b49618e91a3d4cf025bf')
b2sums=('857b4df53c31fc1a6aba74619404f22062e195e478789b24e486985c71ac208ba03558f3c74aba41f6ce321ec2fa4776d999b1a1b1474b28282c6fa39733490a')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
