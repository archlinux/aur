# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_consignment
_name=trytond_stock_consignment
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to manage consignment stock"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cc1950c45fe9638b0e6688465fdfd9c58cca3a39baa112ff010a7cf052b4b2ca')
sha512sums=('6cf033f4608872ae1b51ec73152b3cc688fb6b9b9a71bd37d68d374680d260e106dfc48d05ed0bcd75d0ee485456e62ca92ee3772f5be414a6b911afeba35fc9')
b2sums=('ec4ec3dfd368b8a0aadea120ca49220e8f9c31b1072cc9a7b7ff5940d6e7ae7eb731b66b5baf67733333b148fb554a32cbad4bafad0dee0901c12f0b81b8eed4')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
