# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_inventory_location
_name=trytond_stock_inventory_location
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to create inventories by locations"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2db7604ffd21ed8b8a206245f7553abfa1730707e80ebf966a33188e49155e5d')
sha512sums=('9271a15f30b757cbabe0a885d0641a40ec2eb16b355492771c7ba4f03dcfccc0d7d7a1f26487c15b027fbaf32ca3af9cb902f6087af2b23a6fc31bb0326170c4')
b2sums=('eb4d5cac791fa64427eb047e507cf7cd6c43c66b3a0e79473fd21ac40123c3ba8541ae9eb2923c8f2ebc3b30234dfa5445e6bcbe6737a3014b9d5f50fc4f841c')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
