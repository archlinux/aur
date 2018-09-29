# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
pkgver=0.1.47
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
source=("https://files.pythonhosted.org/packages/3f/f9/30979677e679bcf5b1042d0fd1e7b76ddc91ab23c79cf2221dbc387dc74b/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d2301bbfc9a4a07ea80eca2d1a1d6b1f5af5c3ca70b6cbc45de1b1232cd9e628f99a8631b38e8eb30f19416c9207157756e59be7d809bfa8e9e6b2052eb4b716')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests
}

