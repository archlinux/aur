# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_analytic_account
_name=trytond_analytic_account
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for analytic accounting"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1b11b9bfceb0ccc0c5b70a77d5e7bf3a06a506f4121b3cc2fa67fb67a3e7621d')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
