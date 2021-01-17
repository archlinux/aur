# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_dashboard
_name=trytond_dashboard
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for dashboard"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('12a8d17b6a4f8505485f8e8d525a36c95ac10aa54c3e86fdf2c66f8c59258b29')
b2sums=('1caab072ad24aa712450d89adf510f23272d1de04f8b1c139e852020a098a3de505058c90e6fa7cc15c6b5637b101ce1404c07231a87de1815ea0909980f60fd')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
