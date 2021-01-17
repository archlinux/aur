# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_dunning_email
_name=trytond_account_dunning_email
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for account dunning email"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fee7106671b7d51879536f93cc7345c07d71044de04436c84f312388913b5dbd')
b2sums=('435c4c30f82e89af260d3063d965416899d3b60b12be861a2385efd1d14ce1fb481f6b270db68cb0eb804e310a3f7d7bbd61646ec9d06a175c222a2d58eb36e9')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
