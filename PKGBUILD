# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pyzotero')
pkgver=1.4.13
pkgrel=1
_name=pyzotero
pkgdesc="Python client for the Zotero API"
arch=('any')
url="https://github.com/urschrei/pyzotero"
license=('MIT')
source=("$_name-$pkgver.tar.gz::https://github.com/urschrei/pyzotero/archive/v$pkgver.tar.gz")
sha512sums=('3c13187060bda1d7bd07de4aaf1259c3d230b9883e2565001b7826fc1be58e3ceb045674a5ca171fd58cdf9848a436b9a06a040b87849e7d8d918c8afb330c72')
makedepends=('python-setuptools')
depends=('python-feedparser' 'python-pytz' 'python-pathlib' 'python-pathlib' 'python-bibtexparser')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  install -D -m644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
