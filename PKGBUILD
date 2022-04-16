pkgname=python-pz
_module='pz'
pkgver=1.1.0
pkgrel=1
pkgdesc="Utility to substitute awk, sed and/or grep with Python"
url="https://github.com/CZ-NIC/pz"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://github.com/CZ-NIC/pz/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e08b0c56924eac532c0630526cf66d4e038485ce353da11c521e3ec4e4a4c9f5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
