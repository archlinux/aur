pkgname=python-wikitextparser
pkgver=0.42.1
pkgrel=1
pkgdesc="simple parsing tool for MediaWiki's wikitext markup"
arch=('any')
url="https://github.com/5j9/wikitextparser"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/5j9/wikitextparser/archive/v$pkgver.tar.gz")
sha512sums=('309ca051dd42dd014f00a30ade147999e687d6e66ffae979684d70da1a3db4de2b06665fc12fe440c7cd2d4cce74945a354e716c5fe0f12fc31793d14660c837')

build() {
  cd "$srcdir"/wikitextparser-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/wikitextparser-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
