# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_supply_day
_name=trytond_stock_supply_day
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add supply weekdays"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8536cff7e3c1989512bb7984f4baec8f52582f8eb520b9d928eab1bff258ce68')
sha512sums=('49aeb92721391b4ae4daa7af2f43ddde49bd49e3d584a221c4861d1c4c085d38d20a9b8fb7e32a019e6c0124c509838c125d3f6273977772d7e7312bcddb9141')
b2sums=('df08a119b20e53ae36a4224a80f29ba4082d9a34188d98b3c523a44e2ed10f95108b2063bed990fb1f23294ab2a28010edac821db06dcbc209f3cb7f77562133')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
