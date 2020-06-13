# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=mbed-test-wrapper
_pkgname=mbed_test_wrapper
pkgver=1.0.0
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
sha512sums=('42a2166ed2fbc96a806548139a96c6534f940c6d92f8880ad0161103e9106b4524e6282222478c3a0817342aa1460a5a21e4893d81c762f53ca45db458ed3926')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

