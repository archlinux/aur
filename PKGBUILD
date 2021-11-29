# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='wsgilib'
pkgname="python-${_pkgbase}"
pkgver=1.0.3
pkgrel=1
pkgdesc='High-level WSGI library based on flask'
arch=('any')
url="https://github.com/homeinfogmbh/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-flask' 'python-mimeutil' 'python-werkzeug')
makedepends=('git' 'python' 'python-setuptools' 'python-setuptools-scm')
provides=("python-${_pkgbase}")
conflicts=("python-${_pkgbase}")
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
