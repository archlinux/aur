# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgname=python-x3dh
_pkgname2=python2-x3dh
_tag=0.5.6-beta
pkgbase=${_pkgname}
pkgname=("${_pkgname}" "${_pkgname2}")
pkgver=0.5.6.beta
pkgrel=1
pkgdesc="A python implementation of the Extended Triple Diffie-Hellman key agreement protocol"
url="https://github.com/Syndace/${_pkgname}"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${_pkgname}::git+https://github.com/Syndace/${_pkgname}.git#tag=${tag}")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "%s" "$(git describe --tags | sed -e 's/^v//;s/-/./')"
}

package_python-x3dh() {
    depends=('python-xeddsa')
    provides=("${_pkgname}")
    conflicts=("${_pkgname}")

    cd ${_pkgname}
    python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-x3dh() {
    depends=('python2-xeddsa')
    provides=("${_pkgname2}")
    conflicts=("${_pkgname2}")

    cd ${_pkgname}
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
