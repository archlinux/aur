# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_es
_name=trytond_account_es
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton with Spanish chart of accounts"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2fc123c34d19c80ab4f33f6dde729c853ffd61cdc9a90f6092ea6f9e89800f7f')
b2sums=('98b7e5b88562ead0326fea8bd5414a726ffe0fd11b4ae8d66a71b5f61ce7a5f1932bcd4520e16ecc11262ed2edefd9784ba6e6b410a94c6d9d391bcab2569ccf')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
