# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kipart
pkgver=0.1.33
pkgrel=1
pkgdesc="Python package for generating multi-unit schematic symbols for KiCad from a CSV file"
url="https://github.com/xesscorp/KiPart"
depends=('python'
         'python-setuptools'
         'python-affine'
         'python-future'
)
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/k/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7414e03749b214e9cb5fb32a5c4c2d205d9ebba345db8ab5bed9b385f4ba67c5')

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

