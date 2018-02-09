# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=canmatrix-git
pkgver=0.4.r327.g53e47b2
pkgrel=1
pkgdesc='Utility for converting CAN database formats'
arch=('any')
url='https://github.com/ebroecker/canmatrix'
license=('BSD')
depends=(
    'python' 'python-lxml' 'python-xlwt' 'python-xlrd' 'python-xlsxwriter'
    'python-yaml' 'python-future'
)

source=("git+https://github.com/ebroecker/canmatrix.git")
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/canmatrix
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd $srcdir/canmatrix
    python setup.py install --root="${pkgdir}/" --optimize=1
}

