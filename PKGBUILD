# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='functoolsplus'
pkgname="python-${_pkgbase}"
pkgver=1.0.0
pkgrel=1
pkgdesc='More higher-order functions and operations on callable objects.'
arch=('any')
url="https://github.com/homeinfogmbh/${_pkgbase}"
license=('GPLv3')
depends=('python')
makedepends=('git' 'python' 'python-pytest' 'python-setuptools' 'python-setuptools-scm')
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


check() {
    cd "${srcdir}/${_pkgbase}"
    pytest
}


package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
