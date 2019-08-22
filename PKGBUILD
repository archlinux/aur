# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-x3dh
pkgbase=${pkgname}
pkgname=${_pkgname}-git
pkgver=r49.a951c0a
pkgrel=1
pkgdesc="A python implementation of the Extended Triple Diffie-Hellman key agreement protocol"
url="https://github.com/Syndace/${pkgname}"
license=('MIT')
arch=('any')
makedepends=('git' 'python-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git")
sha256sums=('SKIP')
depends=('python-xeddsa')
conflicts=(${_pkgname})
provides=(${_pkgname})

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
