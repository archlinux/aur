# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock
_name=trytond_stock
pkgver=5.8.2
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for stock and inventory"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('53b2ec21e33da0e853d591577a4624a18fdd258916f44bf38e1373aa469b6879')
b2sums=('8ce113828a6bd358ca89073f46d460e2985a72795148badd7e82a2ba1c80a2905a23cc32c04331fcdf2c1a91861cc0233d8da725276cbf0d765b44b74ab08219')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
