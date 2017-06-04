# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python2-advancedhtmlparser
pkgver=7.2.0
pkgrel=1
pkgdesc="Fast Indexed python HTML parser which builds a DOM node tree, providing common getElementsBy* functions for scraping, testing, modification, and formatting"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/AdvancedHTMLParser"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
optdepends=('python2-queryablelist: Support for advanced "filter" functions')
source=("https://github.com/kata198/AdvancedHTMLParser/archive/${pkgver}.tar.gz")
sha512sums=('e0525e03519bfaccf2ebef4c4394049fe09e1a566cbb91568f9d877cdd5395423db3c591b49009736f6bd4861207c78fc336cf0bd7e3608499a63b7c1d0249ba')

build() {
  cd "$srcdir"/AdvancedHTMLParser-$pkgver
  python2 setup.py build
}

package() {
  cd AdvancedHTMLParser-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
