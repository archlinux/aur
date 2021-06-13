# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-scrapelib
pkgver=2.0.4
pkgrel=1
pkgdesc='a library for scraping things'
arch=('any')
url='https://scrapelib.readthedocs.io/en/stable/'
license=('BSD-2-Clause')
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/22/f5/a7abe9e85e835246403bf0e4d1c9dc5a49a36fb6c16896f40a17d1d4e8ce/scrapelib-2.0.4.tar.gz")
sha256sums=('460d6b620e35ee36f0e37f6e8c6a5a27f38c08f9293ad9b7ed139ac3fa191eb2')

_pkgname=scrapelib

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
