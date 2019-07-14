# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_be
_name=trytond_account_be
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module with Belgian chart of accounts"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('df96142d2a7faa0518d6969ac14f3fb3b12de3029f608af2d5842da875e0807e')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
