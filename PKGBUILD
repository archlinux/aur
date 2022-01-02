pkgname=python-wikitextparser
pkgver=0.48.0
pkgrel=1
pkgdesc="simple parsing tool for MediaWiki's wikitext markup"
arch=('any')
url="https://github.com/5j9/wikitextparser"
license=('MIT')
makedepends=('python-dephell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/5j9/wikitextparser/archive/v$pkgver.tar.gz")
sha512sums=('e1c07d423a6afc0395d13506154d6ce69fe1ba287b544b5e1b91c0c20f7758b47073cd03374b7ed1a3b93d6ae1cb43220a4c5a9d93e6bd96d9e5ccc9904b8643')

prepare() {
  cd "$srcdir"/wikitextparser-$pkgver
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$srcdir"/wikitextparser-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/wikitextparser-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
