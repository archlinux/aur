# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pyocd
_pkgname=pyOCD
pkgver=0.24.1
pkgrel=1
pkgdesc="Python On Chip Debugger and programmer for ARM Cortex-M microcontrollers using CMSIS-DAP"
url="https://github.com/mbedmicro/pyocd"
depends=('python'
         'python-setuptools'
         'python-cmsis-pack-manager'
         'python-colorama'
         'python-intelhex'
         'python-intervaltree'
         'python-pyelftools'
         'python-pyusb'
         'python-pyaml'
         'python-six'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/mbedmicro/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('1db718302b73f3dae7d13f69d4965ec05409a04ff42e3582007a006f7a5efd05da18c23d2999a97cd13bf5256846626783fd72feae2449447ebd740fe20c7b87')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

