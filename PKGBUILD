# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pyzotero')
pkgver=1.4.23
pkgrel=1
_name=pyzotero
pkgdesc="Python client for the Zotero API"
arch=('any')
url="https://github.com/urschrei/pyzotero"
license=('MIT')
source=("$_name-$pkgver.tar.gz::https://github.com/urschrei/pyzotero/archive/v$pkgver.tar.gz")
sha512sums=('383809cf7a5ab950871c47101397e3a073f53d41f723acbcbe91d5c62d56c0618a70433a5ae3332d25195d4bce207c57b7f26b7c4c851621282b994f1afbf4b3')
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
