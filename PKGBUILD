# Maintainer: liara <liara@archlinux.email>

pkgname=python-shodan
pkgver=1.20.0
pkgrel=1
pkgdesc="Python library and command-line utility for Shodan"
url="https://github.com/achillean/shodan-python"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-click' 'python-colorama' 'python-click-plugins' 'python-xlsxwriter')
makedepends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/11/c9/96e10064730488dd9817d51ec7bf2d5385191beef317673c03efea466277/shodan-${pkgver}.tar.gz)
sha256sums=('2efe383eeb083eb67137a00cc6fc5ea1fd848ce8053dfdea6696bc6ec05f6e98')
build() {
  cd "$srcdir/shodan-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/shodan-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
