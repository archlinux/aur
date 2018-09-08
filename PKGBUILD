# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# based on python-solid package

pkgname=python-solid-git
pkgver=r317.e322160
pkgrel=1
pkgdesc="SolidPython: OpenSCAD for Python"
arch=('any')
license=('LGPL2.1')
url="https://github.com/SolidCode/SolidPython"
makedepends=()
provides=(python-solid)
conflicts=(python-solid)
depends=('python-euclid3' 'python-pypng' 'python-prettytable')
source=("git+https://github.com/SolidCode/SolidPython.git")
md5sums=(SKIP)

pkgver() {
  cd SolidPython
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/SolidPython
    python setup.py build
}

package() {
    cd ${srcdir}/SolidPython
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
