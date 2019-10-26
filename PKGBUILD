# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-querystring-parser
pkgver=1.2.0
pkgrel=1
pkgdesc='Creates nested dictionaries from sent form/querystring data'
arch=('x86_64')
url='https://github.com/bernii/querystring-parser'
license=('MIT')
depends=('python' 'python-six')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/bernii/querystring-parser/archive/$pkgver.tar.gz")
sha256sums=('27f3b947ad0a70a298c8daa506b458877d57307efcd9833f0174e90a821230b0')

_pkgname=querystring-parser

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
