# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-zotero
_pkgname=py${pkgname#python2-}
pkgver=0.9.9
pkgrel=2
pkgdesc="A Python wrapper fro the Zotero API"
arch=('any')
url="https://github.com/urschrei/pyzotero"
license=('GPL')
depends=('python2-feedparser' 'python2-poster' 'python2-pytz')
source=("https://github.com/urschrei/pyzotero/archive/v$pkgver.tar.gz")
md5sums=('608419f9fd9fcd1cb1d78695985a9bee')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

