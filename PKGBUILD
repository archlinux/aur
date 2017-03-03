# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-ng-numpy-randomstate')
_module='ng-numpy-randomstate'
pkgver='1.12'
pkgrel=1
pkgdesc="Numpy compatible random number generators."
url="https://bashtage.github.io/ng-numpy-randomstate"
depends=('python' 'python-numpy')
makedepends=(
    'cython'
    'python-setuptools')
license=('custom:University of Illinois/NCSA Open Source License')
arch=('i686' 'x86_64')
source=("https://github.com/bashtage/ng-numpy-randomstate/archive/${pkgver}.tar.gz")
sha256sums=('f814c1263e663c018c414b8d50943db0')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
