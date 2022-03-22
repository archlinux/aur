# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pyzotero')
pkgver=1.5.2
pkgrel=1
_name=pyzotero
pkgdesc="Python client for the Zotero API"
arch=('any')
url="https://github.com/urschrei/pyzotero"
license=('MIT')
source=("$_name-$pkgver.tar.gz::https://github.com/urschrei/pyzotero/archive/v$pkgver.tar.gz")
sha512sums=('610a0a56854acfa7df7c2ed3467339c9e735c3269e90601ac2e3d0c0c8d538e6023e8d6a6ce9a787c909aa1c005084c0648e5dfd924e81b6ba138811cf630517')
makedepends=('python-setuptools')
depends=('python-feedparser>=6.0.0'
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
