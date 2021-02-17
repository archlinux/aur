# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_asset
_name=trytond_account_asset
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for assets management"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7ce7450555cdbdcd5e4b75469c304f5d635a8f0879ad93a86f61ea2c32e52571')
sha512sums=('3b9d3b1f5a1b65046415e095b88c113d9deefc1bd614825fb999d7d93a6f2e1253d84729fdad21a3cfc5a8f26b5beccaa151713610c9b862aba957f0a3930a8d')
b2sums=('35b1fde3885be74383e82aed0c3d51be66a2d6f2c7608e5fe429d8e2994d8c7e1260c0f2d42daab07bc582620ce5216e10f845af23a0b67f160eeb8ecaf194cd')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
