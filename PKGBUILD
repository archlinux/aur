# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='mcipc'
pkgname="python-${_pkgbase}"
pkgver=2.3.3
pkgrel=1
pkgdesc='Python 3 library and scripts for the RCON and Query protocol'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-setuptools' 'python-rcon')
makedepends=('git' 'python-setuptools-scm')
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
