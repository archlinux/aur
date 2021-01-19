# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pyocd
_pkgname=pyOCD
pkgver=0.29.0
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
sha512sums=('9d03b9489e8ee254c700681feb0d65ee4719f2592797a3d55b1ca4439b8fce60ccd85f165339dd29fdeab816090b6dc67026fdd0d41e5ed24383b1b818b72175')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

