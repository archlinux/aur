# Maintainer: Letu Ren <fantasquex@gmail.com>

pkgname=python-cons
_pkgname=cons
pkgver=0.4.5
pkgrel=1
pkgdesc="An implementation of Lisp/Scheme-like cons in Python"
arch=('any')
url="https://github.com/pythological/python-cons/"
license=('LGPL3')
depends=(
    'python-logical-unification'
)
makedepends=(
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b46b48adb5a5af7f44375da346d926e55a325d4dc12b9add9f20280d3b3742cb')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

