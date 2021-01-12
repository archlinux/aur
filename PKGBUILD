# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='mcwb'
pkgname="python-${_pkgbase}"
pkgver=0.0.7
pkgrel=1
pkgdesc='Python 3 library for Minecraft world manipulation via RCON commands'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-mcipc' 'python-setuptools')
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
