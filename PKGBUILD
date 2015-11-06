# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=mbed-test-wrapper
_pkgname=mbed_test_wrapper
pkgver=0.0.2
pkgrel=1
pkgdesc="Generate Project Files to Debug ELF files"
url="https://github.com/ARMmbed/intelhex"
depends=('python'
         'python-pip'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/source/m/${pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('bd2369d7fc4574d11f4df5b42b73e35c68b3f9d0233b52f96b9809b731490c6f8fcae8d1c9b4b857273886bd98fad15efa20605782773014507d047bdf5eaede')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

