# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-omemo-backend-signal
_pkgname2=python2-omemo-backend-signal
_tag=v0.2.2-beta
pkgname=("python-omemo-backend-signal" "python2-omemo-backend-signal")
pkgver=0.2.2.beta
pkgrel=1
pkgdesc="A backend for python-omemo offering compatibility with libsignal."
url="https://github.com/Syndace/${_pkgname}"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git#tag=${tag}")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "%s" "$(git describe --tag | sed 's/^v//;s/-/./')"
}

package_python-omemo-backend-signal() {
    depends=('python-cryptography'
             'python-xeddsa'
             'python-doubleratchet'
             'python-x3dh'
             'python-protobuf'
             'python-omemo-syndace')
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")

    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-omemo-backend-signal() {
    depends=('python2-cryptography'
             'python2-xeddsa'
             'python2-doubleratchet'
             'python2-x3dh'
             'python2-protobuf'
             'python2-omemo-syndace')
    provides=("${_pkgname2}")
    conflicts=("${_pkgname2}")

    cd ${_pkgname}
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
