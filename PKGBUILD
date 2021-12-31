# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=pyocd-pemicro
pkgname=python-$_pkgname
pkgver=1.1.0
pkgrel=2
pkgdesc="Python On Chip Debugger and programmer for ARM Cortex-M microcontrollers using CMSIS-DAP"
url="https://github.com/pyocd/pyocd-pemicro"
depends=('python'
         'python-pypemicro'
         )
makedepends=('python-setuptools')
license=('BSD-3-Clause')
arch=('any')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('1cb09b299436d4784523b77f66ec5c1d1114d38a71159ab73331c9530e7a77870f17dd9940f4bdcc7e1884139d4d3c987b48c92092e06ed57fe6938e40123384')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

