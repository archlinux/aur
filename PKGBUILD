# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pyzotero')
pkgver=1.5.9
pkgrel=2
_name=pyzotero
pkgdesc="Python client for the Zotero API"
arch=('any')
url="https://github.com/urschrei/pyzotero"
license=('MIT')
source=("$_name-$pkgver.tar.gz::https://github.com/urschrei/pyzotero/archive/v$pkgver.tar.gz")
sha512sums=('b0b5221dc66d69b8d7a13f2c7dc34fe656fd5c61c851e273a0a40fc755ff5fdd463bc2de6726c0ef302ab9f64d0f2589d687257601e582be9502142332e174ee')
makedepends=('python-setuptools')
depends=('python-feedparser>=6.0.0'
         'python-pytz' 
         'python-requests' 
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
