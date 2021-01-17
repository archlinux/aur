# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_statement_ofx
_name=trytond_account_statement_ofx
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to import OFX statements"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7e4fd584b45e91637437778c607308a85177226f2fd8c0e98ba528ed5ab18b3a')
b2sums=('cae6f380fa0f8db3cebc5df67a4f5c614eab926e9bd9c1665b236fa332c6a5a1b873e1e75304ce34e7774a369d9f3559368a0106ec7ab2ba28c4fd50899a6324')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
