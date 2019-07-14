# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_web_user
_name=trytond_web_user
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to manage Web users"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ec0872d3f00ad2785f2835df961a49c39e46c4d9e473a21005d95b500cc10868')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
