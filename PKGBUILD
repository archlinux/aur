# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
pkgver=1.0.4
pkgrel=1
pkgdesc="KiCAD script to convert BOM xml into spreadsheet"
url="https://github.com/xesscorp/KiCost/"
makedepends=('python-setuptools')
depends=('python'
         'python-beautifulsoup4'
         'python-currencyconverter'
         'python-future'
         'python-lxml'
         'python-pycountry'
         'python-tqdm'
         'python-wxpython'
         'python-xlsxwriter'
         'python-yattag'
)
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/k/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('434253b355ec1741cc79b4f3202104b81ccda03c7d0f201618e7125a52614a08186cf805d731ac3e701fdadd8bfb8284c88e052541d5bc18491512ed61acd88b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests
}

