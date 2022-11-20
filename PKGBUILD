# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname='python38-xlrd'
pkgver=2.0.1
pkgrel=3
pkgdesc='Library for developers to extract data from Excel spreadsheet files'
arch=('any')
url='http://www.python-excel.org/'
license=('BSD')
depends=('python38')
makedepends=('python38-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-excel/xlrd/archive/${pkgver}.tar.gz")
sha512sums=('b3e2efa216fc73bf55bb0b165ef63e797d16a00c62f0f2f2a2114d2db7204208f2623835697a045abe185f52c426ed5e9ef38a4f5f8e1880f0cfdf642af3c57e')
b2sums=('eaf6dbefde00954452a96214c6a48e5d35526168445d15d721851da690bd99e53bd765a73495b00c8ee7ce243c487da0afbc6d6217abd7a5956820357dc97104')

build() {
  cd xlrd-${pkgver}

  python3.8 setup.py build
}

package() {
  cd xlrd-${pkgver}

  python3.8 setup.py install --skip-build --root="$pkgdir" --optimize=1

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" docs/licenses.rst
}
