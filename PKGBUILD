# Maintainer: Jeffrey Zhang <zhang.lei.fly#gmail.com>

pkgname=python-i3-tree
_pkgname=i3-tree
pkgver=0.2
pkgrel=2
pkgdesc="Convenient Python lib to manipulate an i3 WM tree"
arch=("any")
url="https://github.com/dustbyte/i3-tree"
makedepends=(
    'python-pip'
    'python-setuptools'
)
license=('BSD')
depends=('python-i3-py')
source=(
    "https://files.pythonhosted.org/packages/a9/5a/902e87bf1a43480b00c82c2804f96d6e6ea6bdb6435ed40f2b4a94923a85/${_pkgname}-${pkgver}.tar.gz"
)

sha256sums=(
    '14584d6d9dd71f2823d91a253dfad5f8032ac9d7d29bf3f713cd34fde1709c12'
)

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir"
}
