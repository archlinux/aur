# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_payment
_name=trytond_sale_payment
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module that manage payments on sale"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5e063ad40387a930fb756a5200b61c8aa96b7496315736a40e2c4d3164e30789')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
