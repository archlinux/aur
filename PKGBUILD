# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='ddnss'
pkgname="python-${_pkgbase}"
pkgver=1.0.5
pkgrel=1
pkgdesc='Update DynDNS hosts registered at ddnss.de'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-setuptools')
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
