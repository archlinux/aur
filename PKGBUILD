# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=valinor
pkgver=0.0.11
pkgrel=1
pkgdesc="Generate Project Files to Debug ELF files"
url="https://github.com/ARMmbed/intelhex"
depends=('python'
         'python-pip'
         'python-yaml'
         'python-jinja'
         'python-colorama'
         'pyocd'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/ARMmbed/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('1f485466f01262f0993a5c173ef16c2d6974dca39fa496423bb752ed49f7b407f387dfdaa815bc2fbb8c33e32b40cb231f30f9a41e6620770ffe7977f56beb37')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

