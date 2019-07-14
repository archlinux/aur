# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_carrier
_name=trytond_carrier
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module with carriers"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8ade200d0b8c833a1eeae9b1e6c2a6a7f66fe1871d06649e001cb3c22b5bb4fa')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
