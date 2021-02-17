# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_supply_production
_name=trytond_stock_supply_production
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for stock supply of production"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3438f918bb27a0c7e7f2c7995d3d49a71625bd33fd555291238c6fe7bb22251c')
sha512sums=('2e52bae834690f30d85b946c0952eced6197819747750e65345a56f7b06fcbbdf0d5604258046f5e45685dc58e995c1248063c7bac8f74d3ffa3260c7917918f')
b2sums=('7a15d9a0c41aec28f9f3eb196bef32874abc15f016651ee542a2e37bcb0e033ae59efd4fe203dcb61f989d76e734607736d7bdddac007b577c23025c6b3da9c1')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
