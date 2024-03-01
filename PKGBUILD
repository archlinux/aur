# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname='python-xlrd-1'
pkgver=1.2.0
pkgrel=1
pkgdesc='Library for developers to extract data from Excel spreadsheet files'
arch=('any')
url='http://www.python-excel.org/'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-xlrd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-excel/xlrd/archive/${pkgver}.tar.gz")
b2sums=('eaf6dbefde00954452a96214c6a48e5d35526168445d15d721851da690bd99e53bd765a73495b00c8ee7ce243c487da0afbc6d6217abd7a5956820357dc97104')

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
