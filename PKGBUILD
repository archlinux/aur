# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_shipment_grouping
_name=trytond_sale_shipment_grouping
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to group sale stock moves"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4e8bcbda944c25eeac24b4742bd21e46319a1a20148f62b551b55fa6ba5436b3')
b2sums=('b153903e6a1b238de174ba9b9c2a96b074b5af754cefa3fbfc8dcc1ad2076ee1b30d0f45b2a4029df70faa1ecb92a99ba72fd7aca4d1b90c629a24e742f696d7')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
