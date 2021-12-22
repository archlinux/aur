# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='peeweeplus'
pkgname="python-${_pkgbase}"
pkgver=1.17.5
pkgrel=1
pkgdesc='Practical extension of a small, expressive ORM'
arch=('any')
url="https://github.com/homeinfogmbh/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-configlib' 'python-peewee' 'python-setuptools' 'python-lxml')
optdepends=(
    'python-argon2_cffi: for Argon2Field'
    'python-authlib: for authlib integration'
)
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
