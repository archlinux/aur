# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-pywikibot
_module='pywikibot'
pkgver=6.0.1
pkgrel=1
pkgdesc="Python MediaWiki Bot Framework"
url="https://www.mediawiki.org/wiki/Pywikibot"
depends=('python' 'python-requests')
optdepends=(
  'python-mwoauth: authentication'
  'python-mwparserfromhell: parsing MediaWiki wikicode'
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

sha256sums=('c8d3b744c1cfe7cc49169ee6f5287acd65e9f587670fe55cb886374c46a03651')
