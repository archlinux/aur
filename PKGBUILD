# Maintainer: Oystein Sture <oysstu a.t protonmail.com>
# Contributor: 

pkgname=python-imcpy
pkgver=1.1.0
pkgrel=1
pkgdesc="Python bindings for Inter-Module Communication Protocol (IMC)"
arch=("any")
license=("MIT")
url="https://github.com/oysstu/imcpy"
depends=('python' 'python-ifaddr')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'cmake')
optdepends=('python-pandas: LSFExporter')
source=("git+https://github.com/oysstu/imcpy.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "imcpy"
    git submodule update --init --recursive
}

build() {
    cd "imcpy"
    python setup.py build
}

package() {
    cd "imcpy"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
