# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-qiime2
pkgver=2020.8.0.dev0
pkgrel=1
pkgdesc="the QIIME 2 framework"
arch=('x86_64')
url="https://qiime2.org"
license=('BSD')
depends=('python' 'python-yaml' 'python-decorator' 'python-tzlocal' 'python-dateutil' 'python-pyparsing' 'python-pyparsing' 'python-pandas' 'python-bibtexparser' 'python-networkx')
makedepends=('python-setuptools')
source=("https://github.com/qiime2/qiime2/archive/${pkgver}.tar.gz")
sha256sums=('76560682412d4da250fd641bc3c5c54e48c9ed2ad2c69bf686c19b3be1b0541a')

build() {
  cd "$srcdir/qiime2-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/qiime2-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
