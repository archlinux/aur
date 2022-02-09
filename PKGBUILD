# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='dzdsu'
pkgname="python-${_pkgbase}"
pkgver=1.3.0
pkgrel=1
pkgdesc='DayZ dedicated server utility.'
arch=('any')
url="https://github.com/conqp/${_pkgbase}"
license=('MIT')
depends=('python' 'python-setuptools' 'steamcmd')
makedepends=('git' 'python' 'python-setuptools-scm')
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
