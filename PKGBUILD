# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-omemo
_pkgname2=python2-omemo
_tag=v0.10.0-beta
pkgbase=python-omemo-syndace
pkgname=("python-omemo-syndace" "python2-omemo-syndace")
pkgver=0.10.0.beta
pkgrel=1
pkgdesc="An open python implementation of the OMEMO Multi-End Message and Object Encryption protocol"
url="https://github.com/Syndace/${_pkgname}"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git#tag=${tag}")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "%s" "$(git describe --tags | sed -e 's/^v//;s/-/./g')"
}

package_python-omemo-syndace() {
    depends=('python-pynacl'
             'python-cryptography'
             'python-xeddsa'
             'python-doubleratchet'
             'python-x3dh'
             'python-protobuf')
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")

    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-omemo-syndace() {
    depends=('python2-pynacl'
             'python2-cryptography'
             'python2-xeddsa'
             'python2-doubleratchet'
             'python2-x3dh'
             'python2-protobuf')
    provides=("${_pkgname2}")
    conflicts=("${_pkgname2}")

    cd ${_pkgname}
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
