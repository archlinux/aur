# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='wgtools'
pkgname="python-${_pkgbase}"
pkgver=1.0.1
pkgrel=1
pkgdesc='Python bindings for wireguard-tools'
arch=('any')
url="https://github.com/conqp/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-setuptools')
makedepends=('git' 'python-setuptools-scm')
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
