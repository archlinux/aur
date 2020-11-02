# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pyocd
_pkgname=pyOCD
pkgver=0.28.2
pkgrel=1
pkgdesc="Python On Chip Debugger and programmer for ARM Cortex-M microcontrollers using CMSIS-DAP"
url="https://github.com/mbedmicro/pyocd"
depends=('python'
         'python-cmsis-pack-manager'
         'python-colorama'
         'python-intelhex'
         'python-intervaltree'
         'python-naturalsort'
         'python-prettytable'
         'python-pyaml'
         'python-pyelftools'
         'python-pyusb'
         'python-setuptools'
         'python-six'
         'pylink'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/mbedmicro/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0c23336fa6fc189fe55e6a08e52f5c99c8b08ad47410e446c3f8814bf4f35a83fc0281f3c7f18595a1a628a2464ad5aeb3debc2bc6183e2e275dd00cf3750835')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

