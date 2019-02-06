# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-qiime2
pkgver=2019.1.0
pkgrel=1
pkgdesc="the QIIME 2 framework"
arch=('any')
url="https://qiime2.org"
license=('BSD 3-Clause License')
depends=('python' 'python-yaml' 'python-decorator' 'python-tzlocal' 'python-dateutil' 'python-pyparsing' 'python-pyparsing' 'python-pandas' 'python-bibtexparser-git')
makedepends=('python-setuptools')
source=("https://github.com/qiime2/qiime2/archive/${pkgver}.tar.gz")
sha256sums=('2c8cb4d6ea4a9dbc5876005b75b0d922ed6c861601002d340c2b991af28097b9')

build() {
  cd "$srcdir/qiime2-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/qiime2-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
