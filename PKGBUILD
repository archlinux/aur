# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pyocd
_pkgname=pyOCD
pkgver=0.29.0
pkgrel=2
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
sha512sums=('7baded9b3667ba2cadc6f800a56c6cea4b54a4c4e5567b90f3437ca0000d5c756acaf21c5b57262baf8022f95ea60bc936b1e7d2434a336fe62c1665b59ea956')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

