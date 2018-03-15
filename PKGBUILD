# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=('python-pywikibot')
_module='pywikibot'
pkgver='3.0.20180304'
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

sha256sums=('2f5bcb646e3519040b198b8752c3bb05b040d67d02d6c64fb29d93e9f84d8a53')
