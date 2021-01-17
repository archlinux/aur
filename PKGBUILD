# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_stock_continental
_name=trytond_account_stock_continental
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for continental real-time stock valuation"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1651bd965970ba378c038fc80787e98d1a2ab1d3a2091fecd1a68c9994330b99')
b2sums=('59bb3ad5a2b72f3d13586eaeb95b5d67c7f827a40bee084cc930950dbcce2549a62eede9b2251a129642d30ec186a5293e104383ff16fc59af0f3990a6376b49')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
