# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname='python38-xlwt'
pkgver=1.3.0
pkgrel=6
pkgdesc="Library to create spreadsheet files compatible with MS Excel 97/2000/XP/2003 XLS files"
arch=('any')
url="http://www.python-excel.org/"
license=('BSD')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://github.com/python-excel/xlwt/archive/${pkgver}.tar.gz")
sha256sums=('1961682c6a3cedb44e6a96ff6ed099d80af8da9a669dbbbc1d1959e8398122d6')

build() {
  cd "$srcdir"/xlwt-${pkgver}
  python3.8 setup.py build
}

package() {
  cd "$srcdir"/xlwt-${pkgver}
  python3.8 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 docs/licenses.rst "$pkgdir/usr/share/licenses/$pkgname/licences.rst"
}
