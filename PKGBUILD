# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_company
_name=trytond_company
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module with companies and employees"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a60c743cd4e0ef188e97f0c4fa841729eff11cf9812711581b98cec47cab73a5')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
