# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=mbed-test-wrapper
_pkgname=mbed_test_wrapper
pkgver=0.0.3
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
sha512sums=('d0b968dd545d3c0b098803bd3c21e61bbaab245ecbca0e1b20281e026b1050e2c380e408289d6de3eef3fd19f1d544f913de330e9256edf9410a1d086f5aaa99')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

