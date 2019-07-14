# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_deposit
_name=trytond_account_deposit
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for accounting deposit"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7b901362c496ec7a544530a4fe6dab68473e26a6ec12abb662b482c5ff76e19b')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
