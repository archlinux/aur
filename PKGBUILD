# Maintainer: Maciej Dems <macdems@gmail.com>

pkgname='python-defopt-git'
_module='defopt'
pkgver=6.0.2.post33+g5859ef2
pkgrel=1
pkgdesc="Effortless argument parser"
arch=('any')
url="https://github.com/macdems/defopt"
license=('MIT')
depends=('python' 'python-sphinx')
makedepends=('python-setuptools' 'python-wheel' 'git')
provides=('python-defopt')
conflicts=('python-defopt')
source=("git+https://github.com/macdems/defopt.git")
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
