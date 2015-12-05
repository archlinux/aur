# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
pkgver=0.1.12
pkgrel=1
pkgdesc="KiCAD script to convert BOM xml into spreadsheet"
url="https://github.com/xesscorp/KiCost/"
depends=('python2'
         'python2-pip'
         'python2-beautifulsoup4'
         'python2-xlsxwriter'
         'python2-future'
         'python2-lxml'
)
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/k/${pkgname}/${pkgname}-${pkgver}.zip")
sha512sums=('c72674d2af2dee4efd136f5a063c7072a9659c48015ee04c58266ab3c3f59ba4dea2fd0550ebabc8ed77839bee9158cae7bf38e966c63caac8c866a36b683072')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Trivial python 2to3 conversion is a lost cause
    #2to3 -w .

    #sed -ie 's:^#\! /usr/bin/python$:#! /usr/bin/env python2:' b2

    python2 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1 
}

