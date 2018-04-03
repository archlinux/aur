# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=('python-pywikibot')
_module='pywikibot'
pkgver='3.0.20180403'
pkgrel=1
pkgdesc="Python MediaWiki Bot Framework"
url="https://www.mediawiki.org/wiki/Pywikibot"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pywikibot/pywikibot-${pkgver}.tar.gz")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

sha256sums=('6a8c5b633185949c724260605d6acbc66104ea69211585ce3a2a937d12f729a5')
