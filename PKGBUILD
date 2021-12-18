# Maintainer: Maciej Dems <macdems@gmail.com>

pkgname='python-defopt-git'
_module='defopt'
pkgver=6.2.0.post3+g7564ecf
pkgrel=1
pkgdesc="Effortless argument parser"
arch=('any')
url="https://github.com/anntzer/defopt"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'git')
provides=('python-defopt')
conflicts=('python-defopt')
source=("git+https://github.com/anntzer/defopt.git#branch=vendor-napoleon")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_module}"
    python setup.py --version
}

build() {
    cd "${srcdir}/${_module}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
