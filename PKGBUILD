# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_classification
_name=trytond_product_classification
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to implement product classification"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fc18cadef190ca32b8fb5a28225191d9250dd87869958ce50ad2ca09809cdd73')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
