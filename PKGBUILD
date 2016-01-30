# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kipart
pkgver=0.1.14
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
source=("https://pypi.python.org/packages/source/k/${pkgname}/${pkgname}-${pkgver}.zip")
sha512sums=('7dc6721429a83746335823627ffc721c4a04f8e55fb260eff161a788db5e0d4f71d3d80e87e75701ccb597a471fa9c2b8f5efe5cd21006fedebb4f9667c89d19')

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

