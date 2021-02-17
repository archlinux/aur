# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_invoice
_name=trytond_account_invoice
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for invoicing"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f4d77d901c9e70fd2e1bc4d8233586e25946270938e6cf5cc57dc5d9a6c87050')
sha512sums=('330f701eeca0239b14ea26fa4e59e4c6cada5cae65dd1fde0164a86aac1822d7ee8f8c3ce90676c9f10e47bb46d88a1e0dae6592121418f14207261d958b33b0')
b2sums=('20ef21fdf8cdda6314abd3e3989f3c8e46c67c8780211c86d189f00992cc06c3c17b88e4a02de80b9d6bab99b18a9ff8616583f3c145d6159f9755783deabd65')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
