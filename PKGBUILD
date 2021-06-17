# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-scrapelib
pkgver=2.0.5
pkgrel=1
pkgdesc='a library for scraping things'
arch=('any')
url='https://scrapelib.readthedocs.io/en/stable/'
license=('BSD-2-Clause')
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/cc/54/e0e10c4d9ed85c0a67518f4588216517ac207ac4d5f59b6d811d1e8d9ece/scrapelib-2.0.5.tar.gz")
sha256sums=('fbfc520c7ac4cf8cfbf859b7bddf78be6b47bb4dcb07aec899dc26af9d128928')

_pkgname=scrapelib

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
