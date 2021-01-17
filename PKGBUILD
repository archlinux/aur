# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_secondary_unit
_name=trytond_sale_secondary_unit
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to add a secondary unit on sale line"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b93af92044b7f58d8cd08d381d7088baeba0a888161607a383ef5edf86ebe5cb')
b2sums=('9798a477d5cd0d8b2cbc2f3fcf04948b02177fc9d1b78b35e543f8857d8fc990ee2979173d60c768aab20fa53bb4a0e9149bb8b905f2c515afa963b82371175f')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
