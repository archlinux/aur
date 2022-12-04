# Maintainer: Althorion <althorion <at> protonmail <dot> com>

pkgbase='python-aocd'
pkgname=('python-aocd')
_module='advent-of-code-data'
pkgver='1.3.1'
pkgrel=1
pkgdesc="Get your puzzle data with a single import"
url="https://github.com/wimglenn/advent-of-code-data"
depends=('python' 'python-dateutil' 'python-requests' 'python-termcolor' 'python-beautifulsoup4' 'python-pebble' 'python-tzlocal')
optdepends=('python-browser-cookie3: aocd-token utility script')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('552e7886c193c52cac71f14ef55c5d7cc1c7ebd0e9e2271be37b01df739f92cc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
