# Maintainer: Bidski <bidskii at gmail dot com>
pkgname=python-pybfd3-git
pkgver=0.1.5
pkgrel=1
pkgdesc="A Python (3.x compatible) interface to the GNU Binary File Descriptor (BFD) and opcodes library"
arch=('i686' 'x86_64')
url="https://github.com/b-2-r/pybfd3"
license=('GPLv2')
depends=('python' 'binutils')
optdepends=()
makedepends=('python' 'python-setuptools')
_pkgname=pybfd3
source=("${_pkgname}::git+https://github.com/b-2-r/${_pkgname}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build --with-static-binutils /usr
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --with-static-binutils="/usr" --root="${pkgdir}/" --optimize=1
}
