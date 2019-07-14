# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_dunning
_name=trytond_account_dunning
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for account dunning"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('753d3125ea4f452e4d2315b7ea333b5e6b834d74a7707e9e6b2ef1b7b0cd8ce5')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
