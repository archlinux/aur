# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_package
_name=trytond_stock_package
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for stock packaging"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('df0f266b33f766696d4a8cd2e673cdf58adaf91f1245181b5faea464dc7e94e0')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
