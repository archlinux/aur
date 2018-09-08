# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-x3dh
_pkgname2=python2-x3dh
pkgbase=${_pkgname}-git
pkgname=("${_pkgname}-git" "${_pkgname2}-git")
pkgver=r38.8fe3233
pkgrel=3
pkgdesc="A python implementation of the Extended Triple Diffie-Hellman key agreement protocol"
url="https://github.com/Syndace/${_pkgname}"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-x3dh-git() {
    depends=('python-hkdf'
             'python-xeddsa-git')
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")

    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-x3dh-git() {
    depends=('python2-hkdf'
             'python2-xeddsa-git')
    provides=("${_pkgname2}")
    conflicts=("${_pkgname2}")

    cd ${_pkgname}
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
