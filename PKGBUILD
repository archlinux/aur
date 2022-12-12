# Maintainer: Althorion <althorion <at> protonmail <dot> com>

pkgbase='python-aocd'
pkgname=('python-aocd')
_module='advent-of-code-data'
pkgver='1.3.2'
pkgrel=1
pkgdesc="Get your puzzle data with a single import"
url="https://github.com/wimglenn/advent-of-code-data"
depends=('python' 'python-dateutil' 'python-requests' 'python-termcolor' 'python-beautifulsoup4' 'python-pebble' 'python-tzlocal')
optdepends=('python-browser-cookie3: aocd-token utility script')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('890077ab858082bad28b4225e0c6059ac1e6fd088cb26ccfe07f5c6c3b0a530b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
