# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-omemo-backend-signal
_pkgname2=python2-omemo-backend-signal
pkgname=("python-omemo-backend-signal-git" "python2-omemo-backend-signal-git")
pkgver=r7.3df3d98
pkgrel=1
pkgdesc="A backend for python-omemo offering compatibility with libsignal."
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

package_python-omemo-backend-signal-git() {
    depends=('python-cryptography'
             'python-xeddsa-git'
             'python-doubleratchet-git'
             'python-x3dh-git'
             'python-protobuf'
             'python-omemo-syndace-git')
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")

    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-omemo-backend-signal-git() {
    depends=('python2-cryptography'
             'python2-xeddsa-git'
             'python2-doubleratchet-git'
             'python2-x3dh-git'
             'python2-protobuf'
             'python2-omemo-syndace-git')
    provides=("${_pkgname2}")
    conflicts=("${_pkgname2}")

    cd ${_pkgname}
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
