# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-omemo
_pkgname2=python2-omemo
pkgbase=python-omemo-syndace-git
pkgname=("python-omemo-syndace-git" "python2-omemo-syndace-git")
pkgver=r78.c4e85ac
pkgrel=1
pkgdesc="An open python implementation of the OMEMO Multi-End Message and Object Encryption protocol"
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

package_python-omemo-syndace-git() {
    depends=('python-pynacl'
             'python-cryptography'
             'python-xeddsa-git'
             'python-doubleratchet-git'
             'python-x3dh-git'
             'python-protobuf')
    provides=("python-omemo-syndace")
    conflicts=("python-omemo-syndace")

    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-omemo-syndace-git() {
    depends=('python2-pynacl'
             'python2-cryptography'
             'python2-xeddsa-git'
             'python2-doubleratchet-git'
             'python2-x3dh-git'
             'python2-protobuf')
    provides=("python2-omemo-syndace")
    conflicts=("python2-omemo-syndace")

    cd ${_pkgname}
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
