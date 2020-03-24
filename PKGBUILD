# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-doubleratchet
_tag=v0.7.0-beta
pkgbase=${_pkgname}
pkgname=${_pkgname}
pkgver=0.7.0.beta
pkgrel=5
pkgdesc="A python implementation of the Double Ratchet algorithm"
url='https://github.com/Syndace/python-doubleratchet'
license=('MIT')
arch=('any')
makedepends=('git' 'python-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git#tag=${_tag}")
sha256sums=('SKIP')
depends=('python-cryptography')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd ${_pkgname}
    printf "%s" "$(git describe --tags | sed -e 's/^v//;s/-/./')"
}

build() {
    cd ${_pkgname}
    python3 setup.py build
}

package() {
    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
