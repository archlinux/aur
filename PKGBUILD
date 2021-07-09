# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-pywikibot
_module='pywikibot'
pkgver=6.4.0
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

sha256sums=('de634041ca17b596a81ced7c32400b16307b0df1830d3870a3aa2faec9ce7a8e')
