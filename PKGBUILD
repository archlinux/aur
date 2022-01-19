# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='configlib'
pkgname="python-${_pkgbase}"
pkgver=1.0.2
pkgrel=1
pkgdesc='Configuration file parsing library'
arch=('any')
url="https://github.com/homeinfogmbh/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-setuptools')
makedepends=('git' 'python-pytest' 'python-setuptools-scm')
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')

check() {
    cd "${srcdir}/${_pkgbase}"
    pytest
}

build() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
