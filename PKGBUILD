# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_supply
_name=trytond_sale_supply
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for sale supply"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('90224fc61b4daf91f1bf1a74a58ab2212719c2c19fe2b1d30eeebab4b39a9f0a')
sha512sums=('9176211a0b9448b3d0dbac0df711f6ea3eaedd1138461ba4d0df75ba0d43874cf73acff6f53477b11732b458251adedc0ee3578acf90a8eb1765912350fb71a1')
b2sums=('b06a08d252f3ebb571e5ba2b33bd44cd9212180b12f9c44d76749adfc0640b2a3c09796990f8518efb3608566a8af5abb11a95ffaeb2c6221f35a663ee7b72f8')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
