# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_user_role
_name=trytond_user_role
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to manage role on user"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c23cf2c691a6b4015d52050b688af7bb4da5ad42699d4d3dd6485fda8209a32b')
sha512sums=('b38e40b9140ccb4ede9239252fb09ae823662f9562f6b1ff46adfd1f670aa589e8f58a3a82137baea14eb298e1939a18773638863fa6625edb1fdfd19984ef72')
b2sums=('2df37a6e7c779f0497dd08b4a6eaba9dd43050af132c8b03be1764cd04b36db78cd91a41c921736966a472162507259233509aa20da958c795d85aaa1b29ff00')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
