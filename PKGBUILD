# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='mines'
pkgname="python-${_pkgbase}"
pkgver=1.0.6
pkgrel=2
pkgdesc='A mine sweeping game for the console'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
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
