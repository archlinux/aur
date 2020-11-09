# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pyocd
_pkgname=pyOCD
pkgver=0.28.3
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
sha512sums=('b9890cb085173aa938430becab4a24f5a051328cf83215bcd18e6fef0d2901eace2754f484d042f837f0a47d0a76b1f257396c7edb0bdbeb5e14d7da70ee861a')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

