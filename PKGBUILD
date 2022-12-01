# Maintainer: Althorion <althorion <at> protonmail <dot> com>

pkgbase='python-aocd'
pkgname=('python-aocd')
_module='advent-of-code-data'
pkgver='1.2.3'
pkgrel=1
pkgdesc="Get your puzzle data with a single import"
url="https://github.com/wimglenn/advent-of-code-data"
depends=('python' 'python-dateutil' 'python-requests' 'python-termcolor' 'python-beautifulsoup4' 'python-pebble' 'python-tzlocal')
optdepends=('python-browser-cookie3: aocd-token utility script')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b699cad920bb06694e0c255cfafe75883fbe2743670261527603b0b705cbf97f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
