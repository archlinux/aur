# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname='python-xlrd-1'
pkgver=1.2.0
pkgrel=2
pkgdesc='Library for developers to extract data from Excel spreadsheet files'
arch=('any')
url='http://www.python-excel.org/'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-xlrd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-excel/xlrd/archive/${pkgver}.tar.gz")
b2sums=('ea9b351faa60bbeac1f60b700abe392bec2df7ff5880abc13524579a621ef601af62fd6120a0e33043df74c48d3b4f8a170e33aae09ab816ba632a0c2c018344')

build() {
  cd xlrd-${pkgver}

  python setup.py build
}

package() {
  cd xlrd-${pkgver}

  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" docs/licenses.rst
}
