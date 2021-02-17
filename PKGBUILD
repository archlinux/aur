# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_lot
_name=trytond_stock_lot
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for lot of products"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d5eb5ccd9310971ab7ffb1cd2690462ab07ea996f545c42d47f2d4ef98304e70')
sha512sums=('fe239bf4343302fe40b768fcf2a796049e20567398b56d91e2569ae38d7b95204f4b793a40b0876e15011966432e42102a3d941dcd7490f5e8143cfe093fc3b7')
b2sums=('9177958053cdc5dc9a8b269a65d18b672eec6000b147c1159965408dfa5e84949b2ca641d87f4a82a4564a51def26d08da1ddcc7bee7ebf39ac46584cefd0cd0')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
