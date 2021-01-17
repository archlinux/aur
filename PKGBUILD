# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_asset
_name=trytond_account_asset
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for assets management"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7ce7450555cdbdcd5e4b75469c304f5d635a8f0879ad93a86f61ea2c32e52571')
b2sums=('35b1fde3885be74383e82aed0c3d51be66a2d6f2c7608e5fe429d8e2994d8c7e1260c0f2d42daab07bc582620ce5216e10f845af23a0b67f160eeb8ecaf194cd')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
