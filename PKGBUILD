# Maintainer: Jose Carlos Temprado <thempra@overxet.com>

pkgname=python-pandas-ta
pkgver=0.3.14
pkgrel=1
pkgdesc='Pandas TA - A Technical Analysis Library in Python 3'
arch=('x86_64')
url="https://github.com/twopirllc/pandas-ta"
license=('MIT')
source=("https://github.com/twopirllc/pandas-ta/archive/refs/tags/$pkgver.zip")
sha256sums=('ae3fea05a3c6afee9e02eb417037a6c7990acc2b5ee7815a5697f7696a9b6b26')

build() {
  cd pandas-ta-${pkgver}
  python setup.py build
}

package() {
  cd pandas-ta-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests 

}
