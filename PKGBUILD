# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kipart
pkgver=0.1.40
pkgrel=1
pkgdesc="Python package for generating multi-unit schematic symbols for KiCad from a CSV file"
url="https://github.com/xesscorp/KiPart"
depends=('python'
         'python-affine'
         'python-future'
         'python-openpyxl'
         'python-pyparsing'
         'python-setuptools'
)
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/k/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2027cde4a98a636272ebcf2d8033add4efe02c95036c1162a1660d9143ab457a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}

