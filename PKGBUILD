# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-pywikibot
_module='pywikibot'
pkgver=6.6.1
pkgrel=1
pkgdesc="Python MediaWiki Bot Framework"
url="https://www.mediawiki.org/wiki/Pywikibot"
depends=('python' 'python-requests')
optdepends=(
  'python-mwoauth: authentication'
  'python-mwparserfromhell: parsing MediaWiki wikicode (either mwparserfromhell or wikitextparser is required)'
  'python-wikitextparser: parsing MediaWiki wikicode (either mwparserfromhell or wikitextparser is required)'
  'python-stdnum: cosmetic changes for numbers'
)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pywikibot/pywikibot-$pkgver.tar.gz")

build() {
    cd "$srcdir/$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_module-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('22e587318eb4148b92ae759010a13f2defd8c711c73656ab2dd5b5c19ac4084b')
