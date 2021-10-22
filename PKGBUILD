# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pyzotero')
pkgver=1.4.26
pkgrel=1
_name=pyzotero
pkgdesc="Python client for the Zotero API"
arch=('any')
url="https://github.com/urschrei/pyzotero"
license=('MIT')
source=("$_name-$pkgver.tar.gz::https://github.com/urschrei/pyzotero/archive/v$pkgver.tar.gz")
sha512sums=('a0b0bf92458746b0dd0c01511efb05dd8fb471434c9e813c9d6dab7741a2eb1a10af2b9c5f68daa4c681353ba8c93cab140ec2da5962d06c76e8a229d4742009')
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
