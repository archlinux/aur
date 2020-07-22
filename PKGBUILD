# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pyocd
_pkgname=pyOCD
pkgver=0.27.1
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
sha512sums=('40ab16570053fa08cd6c28322c08af1c3b04bed7da6dd2d81414c85d3cca9dd8f6fad2ed4ab4a9ed7326ee39fc03475ce13246e2cfaa26506cd1ecde703aba3f')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

