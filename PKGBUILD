# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-querystring-parser
pkgver=1.2.4
pkgrel=1
pkgdesc='Creates nested dictionaries from sent form/querystring data'
arch=('x86_64')
url='https://github.com/bernii/querystring-parser'
license=('MIT')
depends=('python' 'python-six')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/bernii/querystring-parser/archive/$pkgver.tar.gz")
sha256sums=('854a3586d59baf63dfc4e38f76ae320f6a14bb8529a3e2c6552b27471a7a4855')

_pkgname=querystring-parser

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
