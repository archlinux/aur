# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
pkgver=0.1.43
pkgrel=1
pkgdesc="KiCAD script to convert BOM xml into spreadsheet"
url="https://github.com/xesscorp/KiCost/"
makedepends=('python-setuptools')
depends=('python'
         'python-beautifulsoup4'
         'python-xlsxwriter'
         'python-future'
         'python-lxml'
         'python-yattag'
         'python-tqdm'
         'python-currencyconverter'
         'python-wxpython'
)
optdepends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/f6/7b/c9a5a4259364a69c7f4011b5cb19ac1f8e43e6d855b25ef3e82b730148c9/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2dcb4f5a113fd0ee5a92d5e96310729d930d268520ff7d22848498395f5ba2fbb9953a21305491adfb02a7377cef589eabe72cd78b9830ffb409700d168276e1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests
}

