# Maintainer: Althorion <althorion <at> protonmail <dot> com>

pkgbase='python-aocd'
pkgname=('python-aocd')
_module='advent-of-code-data'
pkgver='1.3.0'
pkgrel=1
pkgdesc="Get your puzzle data with a single import"
url="https://github.com/wimglenn/advent-of-code-data"
depends=('python' 'python-dateutil' 'python-requests' 'python-termcolor' 'python-beautifulsoup4' 'python-pebble' 'python-tzlocal')
optdepends=('python-browser-cookie3: aocd-token utility script')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('732e63118bf1a59612a15ddcbcb2d9203c838abfed1faeb2c3153620d4cbb2fa')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
