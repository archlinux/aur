# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kipart
pkgver=0.1.13
pkgrel=2
pkgdesc="Python package for generating multi-unit schematic symbols for KiCad from a CSV file"
url="https://github.com/xesscorp/KiPart"
depends=('python'
         'python-pip'
         'python-affine'
         'python-future'
)
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/k/${pkgname}/${pkgname}-${pkgver}.zip")
sha512sums=('a06ef6ab001c3125492dbb934428b94dc8b965458866783a970fa6a68a89cf9b8663dcf7c5c80b6e07c76b4ba257f6412e00d56714f09489362e05280d3fc4ac')

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

