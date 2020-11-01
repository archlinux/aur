# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-pywikibot
_module='pywikibot'
pkgver=5.1.0
pkgrel=1
pkgdesc="Python MediaWiki Bot Framework"
url="https://www.mediawiki.org/wiki/Pywikibot"
depends=('python' 'python-requests')
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

sha256sums=('e81aca046439c8809e3b0132016ff59198e3a90231751e217f451e0eae372a1e')
