# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname='python-defopt-git'
_module='defopt'
pkgver=6.0.2.r0.gbed2178
pkgrel=1
pkgdesc="Effortless argument parser"
url="https://github.com/anntzer/defopt"
depends=('python' 'python-sphinxcontrib-napoleon')
makedepends=('python-setuptools' 'python-wheel')
conflicts=('python-defopt')
license=('MIT')
arch=('any')
source=("git+https://github.com/anntzer/defopt.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_module}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_module}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
