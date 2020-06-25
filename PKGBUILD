# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-scrapelib
pkgver=1.2.0
pkgrel=1
pkgdesc='a library for scraping things'
arch=('any')
url='https://scrapelib.readthedocs.io/en/stable/'
license=('BSD-2-Clause')
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/84/df/60b520ee1af5180fe93b07e1c1b27263bec1b141fd878ff8f8eca969753f/scrapelib-${pkgver}.tar.gz")
sha256sums=('9a30f1404f3473488e1b9af99824316d4c79a94cc39e99e1f9c331a7fae15e8d')

_pkgname=scrapelib

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
