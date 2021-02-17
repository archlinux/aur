# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_lot_sled
_name=trytond_stock_lot_sled
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for shelf life expiration date of product lots"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ca3420ab4f7e041f294b2ec4de941a05b4e9292ea4ff422c3a0ea69c3e7b3ef3')
sha512sums=('a701f867ab5232d2983b644bfe5077b2845097e3acce510cd5bb1bcd1c978b749453b4fc02eb7edc2dcdeb048035343279830884a100b1c6ceb2c8372f077605')
b2sums=('e3605f8a8d6b73bb029057b5441a8ba2d49109ab1e9ef51f295b06fced0662461e54604db5a721b9bda25e7ae98442cdc5cd4e479cfc76667dc77918f0279b4f')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
