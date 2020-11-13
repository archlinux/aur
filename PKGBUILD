# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pyzotero')
pkgver=1.4.18
pkgrel=1
_name=pyzotero
pkgdesc="Python client for the Zotero API"
arch=('any')
url="https://github.com/urschrei/pyzotero"
license=('MIT')
source=("$_name-$pkgver.tar.gz::https://github.com/urschrei/pyzotero/archive/v$pkgver.tar.gz")
sha512sums=('940e6ae74c706d659035d031e48c99a4df1dc6ff2dcac425048496b7a5a0e0fe68f3b9f294117ca6c52c8df84daad9a6ea18f29ea985c5ad8c9aa0bcddab8f68')
makedepends=('python-setuptools')
depends=('python-feedparser>5.1.0' 
         'python-feedparser<6.0.0'
         'python-pytz' 
         'python-pathlib' 
         'python-bibtexparser')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  install -D -m644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
