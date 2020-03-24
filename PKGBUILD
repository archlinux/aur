# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-doubleratchet
pkgbase=${pkgname}
pkgname=${_pkgname}-git
pkgver=r35.95524cf
pkgrel=2
pkgdesc="A python implementation of the Double Ratchet algorithm"
url='https://github.com/Syndace/python-doubleratchet'
license=('MIT')
arch=('any')
makedepends=('git' 'python-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git")
sha256sums=('SKIP')
depends=('python-cryptography')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    python3 setup.py build
}

package() {
    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
